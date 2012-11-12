Title: COMP2121 - Wk03/04 - Data Transfer/Functions
Date: 2009-04-17 09:10:48
Tags: avr,comp2121,computing

<em>[Updated: Clarified what I wrote about the way stacks in AVR </em><em>work, in the Push/Pop section.</em><em>]</em>
<h2>Data Transfer Instructions</h2>
<a href="/blog/attachments/2009/04/datatransfer.png"><img class="aligncenter size-full wp-image-474" title="datatransfer" src="/blog/attachments/2009/04/datatransfer.png" alt="datatransfer" width="450" height="299" /></a><strong></strong>
<p style="text-align:center;"><em>(Credit: Hui Wu/COMP2121 Lecture Notes)</em></p>

<strong>Load Direct (ld):</strong>
<pre>ld Rd, v
Rd $latex \in$ {r0, r1, ..., r31} and v $latex \in$ {x, x+, -x, y, y+, -y, z, z+, -z}</pre>
(remember the <a href="http://andrewharvey4.wordpress.com/2009/04/13/comp2121-wk04/">X, Y, Z pointers</a>)

<strong>Load Program Memory (lpm):</strong>

Can take on three forms,
<table style="height:132px;" border="0" width="153">
<tbody>
<tr>
<th>Syntax</th>
<th>Operation</th>
</tr>
<tr>
<td>
<pre style="text-align:left;">lpm</pre>
</td>
<td>
<pre style="text-align:center;">R0⟵(Z)</pre>
</td>
</tr>
<tr>
<td>
<pre style="text-align:left;">lpm Rd, Z</pre>
</td>
<td>
<pre style="text-align:center;">R0⟵(Z)</pre>
</td>
</tr>
<tr style="text-align:center;">
<td>
<pre style="text-align:left;">lpm Rd, Z+</pre>
</td>
<td>
<pre>Rd⟵(Z)
Z⟵Z+1</pre>
</td>
</tr>
</tbody></table>
Z contains the byte address while the program flash memory uses word addressing. Therefore the word address must be converted into a byte address before having access to the data on the program flash memory. Example usage, (Table_1&lt;&lt;1 converts the word address into a byte address)
<pre>   ldi zh, high(Table_1&lt;&lt;1) ; Initialise Z pointer
   ldi zl, low(Table_1&lt;&lt;1)
   lpm r16, z+ ; r16=0x76
   lpm r17, z ; r17=0x58
   ...
Table_1: .dw 0x5876
   ..<strong></strong></pre>
<strong>IN/OUT:</strong>

AVR has 64 IO registers. Example,
<pre style="padding-left:30px;">in Rd, A</pre>
<pre style="padding-left:30px;">out A, Rd</pre>
<pre style="padding-left:30px;">where 0 ≤ A ≤ 63.</pre>
<strong>Push/Pop:</strong>

The stack pointer (implemented as two 8-bit registers in the I/O space) points to the next free space in RAM above/below (depends how you look at it) the stack. The stack in AVR is part of the SRAM space, and the stack (in AVR) grows from higher memory locations to lower memory locations. I'm talking about the actual value of the address, so 0xFFFF is a higher address than 0xDDDD. This got me a little confused at one stage because if you draw a picture of memory with 0x0000 at the top of the diagram, and 0x0001 below it and so on then in reference to the diagram a stack that is getting larger with PUSH operations is growing upwards (you usually associate higher to lower with down, this is why I got confused).

So the first thing you must do is initialise the stack pointer (RAMEND is a good starting location).

So a push operation,
<pre>push Rr</pre>
will push Rr onto the stack (ie. put the contents of Rr into the location that the SP points to), and then decrement the SP by 1. Pop has a similar opposite effect.
<h2>Shift Instructions</h2>
<h3>Logical shift left</h3>
<pre>lsl Rd</pre>
<h3><a href="/blog/attachments/2009/04/lsl.png"><img class="aligncenter size-full wp-image-483" title="lsl" src="/blog/attachments/2009/04/lsl.png" alt="lsl" width="450" height="65" /></a>Rotate Left Through Carry</h3>
<pre>rol Rd</pre>
<a href="/blog/attachments/2009/04/rol.png"><img class="aligncenter size-full wp-image-484" title="rol" src="/blog/attachments/2009/04/rol.png" alt="rol" width="450" height="73" /></a>

Both operation change some status register flags.
<h2>Functions</h2>
We dabbed into this in first year but just to revise and extend a little I'll try to reiterate this here.

The <strong>heap</strong> is used for dynamic memory applications (eg. malloc()).

The <strong>stack</strong> is used to store return addresses, parameters, conflict registers and local variables and other things.

In passing parameters in WINAVR (C compiler for AVR) for say a function call they are passed <strong>by value for scalar variables</strong> (eg. char, int, float) and passed <strong>by reference for non-scalar variables</strong> (eg. array, struct).

Rules are needed between the caller and the callee to resolve issues such as,
<ul>
	<li>how to pass values and references to a function?</li>
	<li>where to get the return value?</li>
	<li>how to handle register conflicts? (if a function wants to use a register that was previously in use)</li>
	<li>how to allocate and deallocate stack memory to and from local variables?</li>
</ul>
If a register is used in both caller and callee and the caller needs its old value after the return from the callee, then a register conflict occurs. Either the compiler or the assembly programmer needs to check for this. The work around is to save the conflict registers on the stack.

The return value of a function needs to be stored in designated registers. WINAVR uses r25:r24 for this.

A stack consists of stack frames. A stack frame is created whenever a function is called, and it is freed whenever the function returns.
<a href="/blog/attachments/2009/04/avrstack.png"><img class="aligncenter size-full wp-image-472" title="avrstack" src="/blog/attachments/2009/04/avrstack.png" alt="avrstack" width="450" height="281" /></a>
<p style="text-align:center;"><em>(Credit: Hui Wu/COMP2121 Lecture Notes)</em></p>

<h2>Macros</h2>
The AVR assembler offers macros. A macro is just a segment of code that you define and can then use by just calling the macro. Basically the macro name is just a place holder for the macro code. When the program is assembled the macro name will be replaced by the code that macro defines. This defines a macro named mymacro,
<pre>.macro mymacro
 lds r2, @0
 lds r3, @1
 sts @1, r2
 sts @0, r3
.endmacro</pre>
We can then invoke this macro with,
<pre>mymacro p, q</pre>
The p, q are used like arguments. So @0 will be replaced with p and @1 will be replaced by q. In AVR you can used @0 up to @9 in the macro body.
<h2>Assembly Process</h2>
The AVR assembler uses a two pass process.

Pass One:
<ul>
	<li>Lexical and syntax analysis: checking for syntax errors.</li>
	<li>Record all symbols (labels...) in a <strong>symbol table</strong>.</li>
	<li>Expand macro calls.</li>
</ul>
Pass Two:
<ul>
	<li>Use symbol table to substitute the values for the symbols and evaluate functions (eg. low(-13167)).</li>
	<li>Assemble each instruction (ie. generate machine code). For example add Rd, Rr is encoded as machine code as 0000 11rd dddd rrrr.</li>
</ul>
<h2>References</h2>
Wu, Hui. <a href="http://mahler.cse.unsw.edu.au/webcms2/works/index.php?inc=LN&amp;cid=2050&amp;color=colour0"><em>COMP2121 09s1 Lecture Notes</em></a>.