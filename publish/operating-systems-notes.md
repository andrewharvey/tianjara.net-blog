Title: Operating Systems Notes
Date: 2010-07-31 17:09:19
Tags: computing

<em>Here are are some rough notes I put together as part of revision for a uni course. They are heavily based on the <a href="http://cgi.cse.unsw.edu.au/~cs3231/lectures.php">course lecture notes</a> by Kevin Elphinstone and Leonid Ryzhyk. <strong>All diagrams</strong> are sourced from those lecture notes, some of which are in turn from the text book, A. Tannenbaum, <em>Modern Operating Systems</em>. </em>
<h1>OS Overview</h1>
<ul>
	<li>The OS<strong> hides the details of the hardware</strong> and provides an abstraction for user code.</li>
	<li>The OS is responsible for<strong> allocating resources</strong> (cpu, disk, memory...) to users and processes. It must ensure no starvation, progress, and that the allocation is efficient.</li>
	<li>The kernel is the portion of the OS running in privileged mode (hardware must have some support for privileged mode for the OS to be able to enforce the user and kernel mode distinction).
<a href="/blog/attachments/2010/07/os.png"><img class="alignnone size-full wp-image-1129" title="OS" src="/blog/attachments/2010/07/os.png" alt="Diagram showing how the OS interacts with the system." width="419" height="299" /></a></li>
	<li>When the hardware is in privileged mode all instructions and registers are available. When the hardware is in user mode only a limited sets of instructions, registers and memory locations are available. For instance when in user mode, it is not possible to disable interrupts because otherwise a user could ensure that the OS never gets control again..</li>
	<li>A process is a instance of a program in execution.</li>
	<li>A process in memory usually has at least three segments. The <strong>text segment</strong> for the program code (instructions), a <strong>data segment</strong> called the heap for global variables and dynamically allocated memory, and a <strong>stack segment</strong> used for function calls.</li>
	<li>A process also has an <strong>execution context</strong> which includes registers in use, program counter, stack pointer, etc.</li>
	<li>In a Monolithic OS different parts of the OS like processor allocation, memory management, devices and file systems are not strictly separated into separate layers but rather intertwined, although usually some degree of grouping and separation of components is achieved.</li>
</ul>
<h1>System Calls</h1>
<ul>
	<li>The system call interface represents the abstract machine provided by the operating system.</li>
	<li>man syscalls</li>
	<li>Syscall numbers</li>
	<li>hardware syscall instruction</li>
</ul>
<h1>Processes and Threads</h1>
<ul>
	<li>Processes can contain one or more threads. These threads are units of execution, and always belong to a process.</li>
	<li>A process can terminate by,
<ul>
	<li>normal exit (voluntary), usually returning EXIT_SUCCESS</li>
	<li>error exit (voluntary), usually returning EXIT_FAILURE</li>
	<li>fatal error (involuntary), eg. segfault, divide by zero error</li>
	<li>killed by another process (involuntary), eg. pkill (sending the SIGTERM signal)</li>
</ul>
</li>
	<li>Thread states
<a href="/blog/attachments/2010/07/thread-states.png"><img class="alignnone size-full wp-image-1130" title="thread-states" src="/blog/attachments/2010/07/thread-states.png" alt="Thread states diagram." width="476" height="137" /></a></li>
	<li>Running to ready could be from a voluntary yield, or end of time allocated by the CPU, so the scheduler moves the thread to the Ready queue to give another process a go.</li>
	<li>Running to blocked could be from a calling a syscall and waiting for the response, waiting on a device, waiting for a timer, waiting for some resource to become available, etc.</li>
	<li>The <strong>scheduler</strong> (also called the dispatcher) decides which thread to pick from the read queue to run.
<a href="/blog/attachments/2010/07/threads-and-processes.png"><img class="alignnone size-full wp-image-1131" title="threads-and-processes" src="/blog/attachments/2010/07/threads-and-processes.png" alt="Table of per process and per thread resources." width="382" height="195" /></a></li>
	<li>The idea is that a process with multiple threads can still make process when a single thread blocks, as if one thread blocks, the others can still be working. In more recent times, it allows a process to have threads running on multiple CPU's on modern multi-core machines.</li>
	<li>The other model is<strong> finite-state machine</strong> where syscall's don't block but instead allow the program to continue running and then send the process an interrupt when the syscall has been dealt with. This is not as easy to program though.</li>
</ul>
During the system initialisation background processes (called daemon's on linux, service's on windows) and foreground processes can be started.
<h2>Threads Implementation</h2>
<ul>
	<li><strong>Kernel-threads vs. User-level threads.</strong></li>
	<li>User-level threads
<a href="/blog/attachments/2010/07/user-level-threads.png"><img class="alignnone size-full wp-image-1132" title="user-level-threads" src="/blog/attachments/2010/07/user-level-threads.png" alt="User level threads diagram." width="462" height="274" /></a>
<ul>
	<li>Thread management is <strong>handled by the process</strong> (usually in a runtime support library)</li>
	<li>The advantages  are,
<ul>
	<li>switching threads at user-level is much <strong>cheaper than the OS doing a context switch</strong></li>
	<li>you <strong>can tune your user-level thread scheduler</strong>, and not just use the OS provided one</li>
	<li><strong>no OS support for threads needed</strong></li>
</ul>
</li>
	<li>The disadvantages are,
<ul>
	<li>your threads must yield(), you can't really on an interrupt to give your scheduler control again (this is known as co-operative multithreading)</li>
	<li>cannot take advantage of multiple CPU's</li>
	<li>if one of your user-level threads gets blocks by the OS, your whole process gets blocked (because the OS only sees one thread running)</li>
</ul>
</li>
</ul>
</li>
	<li>Kernel-level Threads
<a href="/blog/attachments/2010/07/kernel-level-threads.png"><img class="alignnone size-full wp-image-1133" title="kernel-level-threads" src="/blog/attachments/2010/07/kernel-level-threads.png" alt="Kernel level threads diagram." width="461" height="273" /></a>
<ul>
	<li>Thread management is done by the kernel through system calls</li>
	<li>The downside is thread management (creation, destruction, blocking and unblocking threads) requires kernel entry and exit, which is expensive</li>
	<li>The upside is we now have preemptive multithreading (the OS just takes control when it wants to schedule another process, so no need to rely on the thread to yield), can take advantage of a multiprocessor, and individual threads can have isolated blocking.</li>
</ul>
</li>
	<li>A Thread switch can happen in between execution of any two instructions, at the same time it must be transparent to the threads involved in the switch. So the OS must save the state of the thread such as the program counter (instruction pointer), registers, etc. as the thread context. The switch between threads by the OS is called a <strong>context switch</strong>.</li>
</ul>
<h1>Concurrency</h1>
<ul>
	<li>A race condition occurs when the computation depends on the relative speed of two or more processes.</li>
	<li>Dealing with race conditions,
<ul>
	<li> <strong>Mutual exclusion</strong>
<ul>
	<li>Identify the shared variables,</li>
	<li>identify the code sections which access these variables (critical region)</li>
	<li>and use some kind of mutual exclusion (such as a lock) to ensure that at most only one process can enter a critical region at a time.</li>
</ul>
</li>
	<li> <strong>Lock-free data structures</strong>
<ul>
	<li>Allow the concurrent access to shared variables, but design data structures to be designed for concurrent access</li>
</ul>
</li>
	<li><strong>Message-based communication</strong>
<ul>
	<li>Eliminate shared variables and instead use communication and synchronisation between processes.</li>
</ul>
</li>
</ul>
</li>
	<li>Mutual Exclusion - enter_region() and leave_region().
<a href="/blog/attachments/2010/07/critical-regions.png"><img class="alignnone size-full wp-image-1134" title="critical-regions" src="/blog/attachments/2010/07/critical-regions.png" alt="Critical regions diagram." width="431" height="216" /></a></li>
	<li>Hardware usually provides some mutual exclusion support by providing an <strong>atomic test and set instruction</strong>.</li>
	<li>A uniprocessor system runs one thread at a time, so concurrency arises from preemptive scheduling. But with multiprocessor machines concurrency also arises from running code in parallel using shared memory.</li>
	<li>The problem with the approach to mutual exclusion so far is that when process B is blocked, it just sits in a loop waiting for the critical region to become available. Can fix this by using sleep and wakeup. We use a <strong>mutex</strong> lock for this.</li>
	<li>Blocking locks can only be implemented in the kernel, but can be accessed by user-level processes by system calls.</li>
	<li><strong>A mutex allows at most one process to use a resource, a semaphore allows at most N processes.</strong></li>
	<li><strong>Producer-consumer problem</strong>
<ul>
	<li>Producer can sleep when buffer is full, and wake up when space available.</li>
	<li>Consumer can sleep when buffer is empty and wake up when some items available.</li>
	<li>Can do using semaphores or condition variables.</li>
</ul>
</li>
	<li><strong>Monitors</strong> are set up to only allow one process/thread to operate inside it at once, with extra requests put in a queue. Implemented by the compiler.</li>
	<li><strong>Condition variables</strong>. cv_create, cv_destroy, cv_wait, cv_signal, cv_broadcast</li>
	<li><strong>Dining philosophers problem</strong>. Need to prevent deadlock.</li>
</ul>
<h1>Deadlock</h1>
<ul>
	<li>A set of processes is deadlocked if each process in the set is waiting for an event that only another process in the set can cause.</li>
	<li>Four conditions for deadlock:
<ul>
	<li><strong>Mutual exclusion condition</strong> (device not shareable amongst threads)</li>
	<li><strong>Hold and wait condition</strong> (a resource can be held, but then block awaiting more resources)
<ul>
	<li>Can attack this by requiring all process ask for all resources at the start, and only start if they are granted.</li>
</ul>
</li>
	<li><strong>No preemption condition</strong> - previously granted resources cannot be forcibly taken away</li>
	<li><strong>Circular wait condition</strong>
<ul>
	<li>Always request resources in the same order</li>
</ul>
</li>
</ul>
</li>
	<li>Dealing with deadlock:
<ul>
	<li>ignore the problem</li>
	<li>detect and recover</li>
	<li>dynamic avoidance (careful resource allocation) - we require some information in advance like which resources and how many will be needed before process starts.
<ul>
	<li>Bankers algorithm</li>
</ul>
</li>
	<li>prevention (negate one of the four conditions for deadlock)</li>
</ul>
</li>
	<li>Starvation is slightly different to deadlock as the system can be making progress, but there are some processes which never make progress.</li>
</ul>
<h1>File Systems</h1>
<ul>
	<li>File systems provide an abstraction of the physical disk. They allow you to store files in a structured manner on a storage device.</li>
	<li>The file system abstraction,
<a href="/blog/attachments/2010/07/fs-abstraction.png"><img class="alignnone size-full wp-image-1135" title="fs-abstraction" src="/blog/attachments/2010/07/fs-abstraction.png" alt="Filesystem abstraction table." width="364" height="191" /></a></li>
	<li>Architecture of the OS storage stack,
<a href="/blog/attachments/2010/07/os-storage-stack.png"><img class="alignnone size-full wp-image-1136" title="os-storage-stack" src="/blog/attachments/2010/07/os-storage-stack.png" alt="OS storage stack." width="101" height="262" /></a></li>
	<li>The application interacts with the system call interface which on linux provides creat, open, read, write, etc.</li>
	<li>In the case of modern hard drives,
<a href="/blog/attachments/2010/07/hard-disk.png"><img class="alignnone size-full wp-image-1137" title="hard-disk" src="/blog/attachments/2010/07/hard-disk.png" alt="Hard disk diagram." width="229" height="159" /></a></li>
	<li>The disk controller (between device driver and physical disk) hides disk geometry and exposes a linear sequence of blocks.</li>
	<li>The device driver hides the device specific protocol to communicate with the disk.</li>
	<li>The disk scheduler takes in requests coming from different processes and schedules them to send one by one to the device driver.</li>
	<li>The buffer cache keeps blocks in memory to improve read and write times for frequently accessed blocks.</li>
	<li>The file system (FS) hides the block numbers and instead exposes the directory hierarchy, files, file permissions, etc. To do this it must know which blocks relate to which file, and which part of the file. It must also manage how to store this on the blocks of the linear address space of the disk, keeping track of which blocks are in use. See Allocation Strategies</li>
	<li>The virtual file system (VFS) provides an interface so that different file systems which are suitable for VFS (ie. they have the concept of files, directories, etc..) can be accessed uniformly.</li>
	<li>The open file table (OF table) and file descriptor table (FD table) keep track of files opened by user-level processes.</li>
</ul>
There are many popular file systems in use today. FAT16, FAT32 are good for embedded devices; Ext2, Ext3, Ext4 are designed for magnetic disks, ISO9660 is designed for CD-ROM's, JFFS2 is optimised for flash memory as you don't want to write to the same location too many times as it wears out. Others include NTFS, ReiserFS, XFS, HFS+, UFS2, ZFS, JFS, OCFS, Btrfs, ExFAT, UBIFS.
<h3>Performance issues with standard magnetic disks</h3>
<ul>
	<li>To access a block on a disk the head must move to the required track (<strong>seek time</strong>), then we have to wait until the required block on the track reaches the head (<strong>rotational delay</strong>). We also have some mostly fixed overhead for the data to be passed between the device and the driver (<strong>transfer time</strong>).</li>
	<li>Total average access time, $latex T_a = T_s + \frac{1}{2r} + \frac{b}{rN}$. Where <em>r</em> is the rotational speed, <em>b</em> is the number of bytes to transfer, <em>N</em> is the number of bytes per track and $latex T_s$ is the seek time.</li>
	<li>Seek time is the most expensive, so we want to ensure that our<strong> disk arm scheduler</strong> gives good performance.
<ul>
	<li><strong>First-in, First-out</strong> (no starvation)</li>
	<li><strong>Shortest seek time first</strong> (good performance, but can lead to starvation)</li>
	<li><strong>Elevator (SCAN)</strong> (head scans back and forth over the disk. no great starvation, sequential reads are poor in one of the directions)</li>
	<li><strong>Circular SCAN</strong> (head scans over the disk in one direction only)</li>
</ul>
</li>
</ul>
<h3>Block Allocation Strategies</h3>
<ul>
	<li><strong>Contiguous Allocation</strong>
<ul>
	<li>Gives good performance for sequential operations as all the blocks for a file are together in order</li>
	<li>though you need to know the maximum file size at creation</li>
	<li>as files are deleted, free space is fragmented (<strong>external fragmentation</strong>)</li>
</ul>
</li>
	<li><strong>D</strong><strong>ynamic Allocation</strong>
<ul>
	<li>Blocks allocated as needed, hence the blocks for a file could be all over the place on the disk</li>
	<li>need to keep track of where all the blocks are and the order for each file</li>
</ul>
</li>
</ul>
<strong>External fragmentation</strong> -<strong> space wasted external to the allocated regions</strong>, this space becomes unusable as its not contiguous (so you have lots of small spaces but you need a larger space to fit a whole file in)

<strong>Internal fragmentation</strong> - <strong>space wasted internal to the allocated memory regions,</strong> eg. you get a 4K block allocated and only use 1K, but the OS can't give the leftover 3K to someone else.
<h3>Keeping track of file blocks</h3>
<ul>
	<li>File allocation table (used for FAT16 and FAT32)</li>
	<li>inode based FS; keep an index node for each file which stores all the blocks of the file.
<ul>
	<li><a href="/blog/attachments/2010/07/inode.png"><img class="alignnone size-full wp-image-1138" title="inode" src="/blog/attachments/2010/07/inode.png" alt="inode" width="261" height="274" /></a></li>
</ul>
</li>
</ul>
<ul>
	<li>Directories are stored as normal files but the FS gives these file special meaning.</li>
	<li>A directory file stores a list of directory entries, where each entry containing the file name (because Ext2/3/4 store these with the directory file, not the inode for the file), attributes and the file i-node number.</li>
	<li>Disk blocks (sectors) have a hardware set size, and the file system has a filesystem set block size which is sector size * 2^N, for some N. A larger N means large files need less space for the inode, but smaller blocks waste less space for lots of small files.</li>
</ul>
<ul>
	<li>Ext2 inodes
<a href="/blog/attachments/2010/07/ext2-inode.png"><img class="alignnone size-full wp-image-1139" title="ext2-inode" src="/blog/attachments/2010/07/ext2-inode.png" alt="ext2 inode" width="114" height="286" /></a></li>
	<li>The top bunch of data is file attributes. Block count is the number of disk blocks the file uses.</li>
	<li>The direct blocks area stores index's for the first 12 blocks used by the file.</li>
	<li>The single indirect is a block numbers to a block which contains more block numbers.w</li>
</ul>
<h3>System call interface</h3>
<a href="/blog/attachments/2010/07/file-interface.png"><img class="alignnone size-full wp-image-1140" title="file-interface" src="/blog/attachments/2010/07/file-interface.png" alt="File syscall interface" width="300" height="226" /></a>
<ul>
	<li>At the system call level a file descriptor is used to keep track of open files. The file descriptor is associated with the FS inode, a file pointer of where to read or write next and the mode the file was opened as like read-only.</li>
	<li>Most Unix OS's maintain a per-process fd table with a global open file table.
<a href="/blog/attachments/2010/07/fd-table.png"><img class="alignnone size-full wp-image-1141" title="fd-table" src="/blog/attachments/2010/07/fd-table.png" alt="File descriptor table." width="400" height="391" /></a></li>
</ul>
<h3>VFS</h3>
<ul>
	<li>Provides a single system call interface for many file systems.
<ul>
	<li>the application can write file access code that doesn't depend on the low level file system</li>
	<li>device can be hard disk, cd-rom, network drive, an interface to devices (/dev), an interface to kernel data structures (/proc)</li>
</ul>
</li>
	<li><a href="/blog/attachments/2010/07/vfs.png"><img class="alignnone size-full wp-image-1142" title="vfs" src="/blog/attachments/2010/07/vfs.png" alt="vfs" width="553" height="402" /></a></li>
	<li><a href="/blog/attachments/2010/07/vnode.png"><img class="alignnone size-full wp-image-1143" title="vnode" src="/blog/attachments/2010/07/vnode.png" alt="vnode" width="600" height="340" /></a></li>
</ul>
Journaling file system keeps a journal (or log) of FS actions which allows for the FS to recover if it was interrupted when performing an action that is not atomic, but needs to be.
<h1>Memory Management and Virtual Memory</h1>
<ul>
	<li>The OS needs to keep track of physical memory, what's in use and which process is it allocated to. It must also provide applications with a view of virtual memory that they are free to use.</li>
	<li>Swapping (sometimes called paging) is where memory is transferred between RAM and disk to allow for more data in memory than we have space for in physical RAM. On base-limit MMU's swapping only allows who programs memory allocation to be swapped to disk, rather than just pages at a time as with virtual memory, hence you can't use swapping here to allow programs larger than memory to run.</li>
	<li>If we are only running one program we can give it all of memory (and either run the in part of it, or in some other ROM). However many systems need more than one process to be running at the same time. Multiprogramming also means that we can be utilising the CPU even when a process is waiting on I/O (ie. give the CPU to the other process). But to support multiprogramming we need to divide memory up.</li>
	<li>We could divide memory up into fixed size partitions and allocate these to processes, but this creates<strong> internal fragmentation (wasted space inside the partition allocated)</strong>.</li>
	<li>Using dynamic partitioning we give each process exactly how much it needs, though this assumes we know how much memory we need before the process is started. This approach also leads to <strong>external fragmentation where we have lots of little unallocated gaps</strong>, but these are too small to be used individually.</li>
	<li>Approaches to dynamic partitioning include <strong>first-fit</strong>, <strong>next-fit</strong>, <strong>best-fit</strong> and <strong>worst-fit</strong>.</li>
	<li>Binding addresses in programs
<ul>
	<li>Compile time</li>
	<li>Load time</li>
	<li>Run time</li>
</ul>
</li>
	<li>Protection - we only want each process to be able to access memory assigned to that process, not other process
<ul>
	<li><strong>Base and Limit Registers </strong>- set by the kernel on a context switch, the hardware handles the rest</li>
	<li><strong>Virtual Memory </strong>- two variants
<ul>
	<li><strong>Paging</strong>
<ul>
	<li>Partition physical memory into small equal sized chunks called <strong>frames</strong>.</li>
	<li>Divide each process's virtual (logical) address space into same size chunks called <strong>pages</strong>. So a virtual memory address consists of a page number and an offset within that page.</li>
	<li>OS maintains a <strong>page table</strong> which stores the frame number for each allocated virtual page.
<a href="/blog/attachments/2010/07/paging.png"><img class="alignnone size-full wp-image-1144" title="paging" src="/blog/attachments/2010/07/paging.png" alt="paging" width="236" height="324" /></a></li>
	<li>No external fragmentation, small internal fragmentation.</li>
	<li>Allows sharing of memory</li>
	<li>Provides a nice abstraction for the programmer</li>
	<li>Implemented with the aid of the MMU (memory management unit).</li>
</ul>
</li>
	<li><strong>Segmentation</strong>
<ul>
	<li>A program's memory can be divided up into segments (stack, symbol table, main program...)</li>
	<li>Segmentation provides a mapping for each of these segments using a base and limit.</li>
	<li><a href="/blog/attachments/2010/07/segmentation.png"><img class="alignnone size-full wp-image-1145" title="segmentation" src="/blog/attachments/2010/07/segmentation.png" alt="segmentation" width="380" height="331" /></a></li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h3>Virtual Memory</h3>
<ul>
	<li>If a program attempts to access a memory address which is not mapped (ie. is an invalid page) a page fault is triggered by the MMU which the OS handles.</li>
	<li>Two kinds of page faults,
<ul>
	<li>Illegal Address (protection error) - signal or kill the process</li>
	<li>Page not resident - get an empty frame or load the page from disk,  update the page table, and restart the faulting instruction.</li>
</ul>
</li>
	<li>Each entry in the page table not only has the corresponding frame number but also a collection of bits like protection bits, caching disabled bit, modified bit, etc.</li>
	<li>Page tables are implemented as a data structure in main memory. Most processes don't use the full 4GB address space so we need a data structure that doesn't waste space.</li>
	<li>The <strong>two level page table</strong> is commonly used,</li>
</ul>
<ul>
	<li><a href="/blog/attachments/2010/07/two-level-pagetable.png"><img class="alignnone size-full wp-image-1146" title="two-level-pagetable" src="/blog/attachments/2010/07/two-level-pagetable.png" alt="Two level page table" width="300" height="404" /></a></li>
	<li>An alternative is the <strong>inverted page table</strong>,</li>
	<li><a href="/blog/attachments/2010/07/ipt.png"><img class="alignnone size-full wp-image-1147" title="ipt" src="/blog/attachments/2010/07/ipt.png" alt="ipt" width="550" height="329" /></a></li>
	<li>The IPT grows with size of RAM, not virtual address space like the two level page table.</li>
	<li>Unlike two level page table which is required for each process, you only need one IPT for the whole machine. The downside is sharing pages is hard.</li>
</ul>
<ul>
	<li>Accessing the page table creates an extra overhead to memory access. A cache for page table entries is used called a<strong> translation look-aside buffer (TLB)</strong> which contains frequently used page table entries.</li>
	<li>TLB can be hardware or software loaded.</li>
	<li>TLB entries are process specific so we can either flush the TLB on a context switch or give entries an address-space ID so that we can have multiple processes entries in the TLB at the same time.</li>
	<li>Principle of Locality (90/10 rule)
<ul>
	<li><strong>Temporal Locality</strong> is the principle that accesses close together in terms of time are likely to be to the same small set of resources (for instance memory locations).</li>
	<li><strong>Spatial locality</strong> is the principle that subsequent memory accesses are going to be close together (in terms of their address) rather than random. array loop example</li>
</ul>
</li>
	<li>The pages or segments required by an application in a time window ($latex \Delta$) is called its memory <strong>working set</strong>.</li>
	<li>Thrashing,
<a href="/blog/attachments/2010/07/thrashing.png"><img class="alignnone size-full wp-image-1148" title="thrashing" src="/blog/attachments/2010/07/thrashing.png" alt="thrashing" width="407" height="209" /></a></li>
	<li>To recover from thrashing, just suspend some processes until it eases.</li>
</ul>
<ul>
	<li><strong>Fetch policy</strong> - when should a page be brought into memory? on demand, or pre-fetch?</li>
	<li><strong>Replacement policy</strong> - defines which page to evict from physical memory when its full and you start swapping to disk.
<ul>
	<li><strong>Optimal</strong></li>
	<li><strong>FIFO</strong> - problem is that age of a page isn't necessarily related to its usage</li>
	<li><strong>Least Recently Used</strong> - works well but need to timestamp each page when referenced.</li>
	<li><strong>Clock</strong> (aka. Second Chance) - an approximation of LRU. Uses a usage or reference bit in the frame table</li>
</ul>
</li>
	<li><strong>Resident Set Size</strong> - how many frames should each process have?
<ul>
	<li>Fixed allocation</li>
	<li>Variable allocation - give enough frames to result in an acceptable fault rate</li>
</ul>
</li>
</ul>
<h1>Input Output</h1>
<ul>
	<li><strong>Programmed I/O</strong> (polling or busy waiting)</li>
	<li><strong>Interrupt Driven I/O</strong>
<ul>
	<li>Processor is interrupted when I/O module (controller) is ready to exchange data</li>
	<li>Consumes processor time because every read and write goes through the processor</li>
</ul>
</li>
	<li><strong>Direct Memory Access</strong> (DMA)
<ul>
	<li>Processor sent interrupt at start and end, but is free to work on other things while the device is transferring data directly to memory.</li>
</ul>
</li>
</ul>
<a href="/blog/attachments/2010/07/double-buffer.png"><img class="alignnone size-full wp-image-1149" title="double-buffer" src="/blog/attachments/2010/07/double-buffer.png" alt="double-buffer" width="302" height="90" /></a>
<h1>Scheduling</h1>
<ul>
	<li>The scheduler decides which task to run next. This is used in multiple contexts, multi-programmed systems (threads or processes on a ready queue), batch system (deciding which job to run next), multi-user system (which user gets privilege?).</li>
	<li>Application behaviour
<ul>
	<li><strong>CPU bound</strong> - completion time largely determined by received CPU time</li>
	<li><strong>I/O bound</strong> - completion time largely determined by I/O request time</li>
</ul>
</li>
	<li>Preemptive (requires timer interrupt, ensures rouge processes can't monopolise the system) v non-preemptive scheduling.</li>
	<li>Scheduling Algorithms can be categorised into three types of systems,
<ul>
	<li><strong>Batch systems</strong> (no users waiting for the mouse to move)</li>
	<li><strong>Interactive systems </strong>(users waiting for results)
<ul>
	<li>Round Robin - each process is run and if it is still running after some timeslice t, the scheduler preempts it, putting it on the end of the ready queue, and scheduling the process on the head of the ready queue.
If the timeslice is too large the system becomes sluggy and unresponsive, if it is too small too much time is wasted on doing the context switch.</li>
	<li>The traditional UNIX scheduler uses a priority-based round robin scheduler to allow I/O bound jobs to be favoured over long-running CPU-bound jobs.</li>
</ul>
</li>
	<li><strong>Realtime systems</strong> (jobs have deadlines that must be meet)
<ul>
	<li>Realtime systems are not necessarily fast, they are <strong>predictable</strong>.</li>
	<li>To schedule realtime tasks we must know, its arrival time $latex a_i$, maximum execution time (service time), deadline ($latex d_i$).</li>
	<li>tasks could be periodic or sporadic.</li>
	<li>slack time is time when the CPU is not being used, we are waiting for the next task to become available.</li>
	<li>two scheduling algorithms,
<ul>
	<li><strong>Rate Monotonic</strong> - priority driven where priorities are based on the period of each task. ie. the shorter the period the higher the priority</li>
	<li><strong>Earliest Deadline First</strong> - guaranteed to work if set of tasks are schedulable. The earlier the deadline the higher the priority.</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h1>Multiprocessor Systems</h1>
<ul>
	<li>For this section we look at shared-memory multiprocessors.</li>
	<li>There are uniform memory accesses multiprocessors and non-uniform memory access multiprocessors which access some parts of memory slower than other parts. We focus on the UMA MP's.</li>
	<li>"<strong>Spinlocking</strong> on a uniprocessor is useless, as another thread on the same processor needs to release it, so blocking asap is desirable. On a multiprocessor, the thread holding the lock may be presently active on another processor, and it could release the lock at any time.
On a multiprocessor, spin-locking can be worthwhile if the average time spent spinning is less than the average overheads of context switch away from, and back to, the lock requester."</li>
	<li><strong>Thread affinity</strong> refers to a thread having some preferred processor to run on an a multiprocessor machine. For instance if thread A started on cpu0 it may want to be scheduled again on cpu0 rather than cpu1 as parts of the cache may still be intact.</li>
	<li><strong>Multiprocessor systems have multiple ready queues</strong>, as just one ready queue would be a shared resource which introduces <strong>lock contention</strong>.</li>
</ul>
<h1>Security</h1>