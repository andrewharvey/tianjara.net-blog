Title: A method for two parties to verify if they share a common secret without revealing that secret if they don't.
Date: 2010-07-23 20:04:07
Tags: mathematics

We didn't cover zero knowledge proofs in the Security Engineering course I did last semester. But part way into the course I needed a way for two people, A and B  to verify that some number they each know is infact the same number N in the case that they don't have a trusted arbitrator and they don't want to reveal the number they each know to the other person unless the other person has the same number.

I don't think this is exactly a zero knowledge proof situation by it seems closely related.  The motivating situation for this was a web application that set some cookies and I wanted to know if one of these cookies set was unique per user or unique per some other setting (but the web application doesn't allow just anyone to create a new account, so I couldn't determine this on my own). In the case that it was unique per user then I don't want to tell anyone what my value for this cookie is because then they may be able to hijack my session.

So a method I thought of was that each person reveals one bit of the number to the other person at a time.

I'll try to formalise this a bit more.

I'll call this number the message. $latex A_M$ is the message $latex A$ knows, $latex B_M$ is the message $latex B$ knows. $latex A$ and $latex B$ arrange that they each know some message and arrange that they wish to verify if $latex A_M = B_M$. If $latex A_M = B_M$ then $latex A$ and $latex B$ must each know that that is the case and if $latex A_M \ne B_M$ then $latex A$ and $latex B$ must also know (after conducting the verification) that this is the case, but do not wish to let the other one know what their message was.

$latex A$ and $latex B$ meet letting $latex A$ be the entity that begins the verification. Each message is first encoded into a binary representation using an agreed upon method. $latex A$ then tells $latex B$ what the 1st bit of $latex A_M$ is (denoted $latex A_M \left [1\right ]$). $latex B$ now verifies this bit with $latex B_M$. If $latex A_M \left [1\right ] = B_M \left [1\right ]$, $latex B$ tells $latex A$ the second bit of $latex B_M$. If $latex A_M \left [1\right ] \ne B_M \left [1\right ]$, $latex B$ randomly selects a bit (ie. randomly selects either 0 or 1) and tells $latex A$ that random bit instead, and flags that $latex A_M \ne B_M$. As soon as either $latex A$ or $latex B$ flags that $latex A_M \ne B_M$ they subsequently always report a random bit regardless of whether the last bit reported to them was correct or not.

We could use an end of message token to indicate the end of the message. Of course this method isn't perfect because if one's random stream of bits matches what the other expects then one thinks that $latex A_M = B_M$ but the other thinks that $latex A_M \ne B_M$.

Another problem is if both parties have determined that $latex A_M \ne B_M$ then when do they stop sending random bits to each other? If both parties are happy to reveal the length of their message then there is no problem. Otherwise both parties can keep sending random bits until they feel that the the message space they have opened up is large enough and they don't mind revealing that the length of their message is less than the bit number they are up too.

Here's an example. A's number is 0110. B's number is 0110 and they want to check if they share the same number.
<pre>A -&gt; B: 0 (B expects this)
B -&gt; A: 1 (A expects this)
A -&gt; B: 1 (B expects this)
B -&gt; A: 0 (A expects this)
A -&gt; B: $ (B expects this) (not needed if they first agree on revealing the message length)
</pre>
Another case A knows 0110, B knows 0010.
<pre>A -&gt; B: 0 (B expects this)
B -&gt; A: 0 (A does not expect this, so A concludes A_M != B_M, and subsequently sends randomness)
A -&gt; B: Rand(0,1) (two cases)
    A sent 0 (B does not expect this, so B also concludes A_M != B_M, and subsequently sends randomness)
        ... continues until the end of M or until one party stops sending randomness.
    A sent 1 (B expects this, but A hasn't revealed anything as they made a random selection)
        B -&gt; A: 0 (A doesn't know if B is sending randomness or not)
        if they agreed upon a message length,
            (A knows that A_M != B_M, but B thinks that A_M == B_M)
            (but A has only revealed 1 bit of A_M to B (because B doesn't know if A was sending A_M or randomness after the 1st bit),
             and B hasn't revealed anything of B_M to A (because A doesn't know if B was sending randomness))#
            (the probability of this happening is z)
        or, no message length agreed upon,
            A keeps sending randomness and B will detect this (because B is expecting the end of stream token and didn't get it), so they both know that A_M != B_M.
</pre>
This is not very formal and I'm confident I've missed some details or left some a bit fuzzy, I only really wanted to explain the general concept.

# To be honest I'm not so sure if this is correct. Rather than me going around in circles unable to solve the math, and just abandoning this post, I'll just leave it be and post with this uncertainty.