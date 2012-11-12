Title: COMP2121 - Wk05 - Interrupts
Date: 2009-06-20 03:33:50
Tags: comp2121,computing

To explain interrupts, Wu used an example of a network card that is downloading a file. The network card has a buffer, and only once this buffer is full (or data stream is complete) should the CPU then copy the contents from the buffer to the RAM. So how does the CPU know when the network card's buffer is full and when to execute the copy? He described two ways here <strong>interrupt</strong> and <strong>polling</strong>.

Polling involves the CPU periodically asking the network card, are you full? Two problems with this method are a) there may be a delay as you have to wait for the poll request to be made and b) it wastes a lot of CPU time. Polling is implemented in software, not hardware.

An alternative to polling is using interrupts whereby the network card will send an interrupt signal to the CPU to get its attention. This needs special hardware to implement, however it is very efficient compared with polling.

An interrupt system must (among other things),
<ul>
	<li>Wait for the current instruction to finish before taking care of the interrupt.</li>
	<li>Return to the interrupted program at the point where it was interrupted.</li>
	<li>Signal the interrupting device with an acknowledge signal when the interrupt has been recognised.</li>
</ul>
IRQ is an interrupt request signal.

A daisy chain arrangement (as seen below) allows multiple devices to send and IRQ. However the CPU cannot determine from the IRQ line which device sent the interrupt. So in a daisy chain system when the CPU receives an IRQ, it will send a signal to IO1 asking "did you send the IRQ?" if IO1 sent the request it will reply "yes", if not it will pass the question on to the next IO device and so on. The response is passed back in the same way.

<a href="/blog/attachments/2009/06/daisychain.png"><img class="aligncenter size-full wp-image-576" title="daisyChain" src="/blog/attachments/2009/06/daisychain.png" alt="daisyChain" width="297" height="132" /></a>

Reset is an interrupt in AVR, and in the AVR Mega64 there are five different sources of reset. There is a flag in the MCU Control Register for each of these and can be used to determine the source of a reset interrupt. The watchdog timer is one source of reset.
<h2>Watchdog Timer</h2>
The watchdog timer is used to try to reset the system if an error such hang occurs. The watchdog timer in AVR can be enabled or disabled.

If the Watchdog timer is enabled, it needs to be periodically reset using the wdr instruction. When (if) the Watchdog times out, it will generate a short reset pulse.