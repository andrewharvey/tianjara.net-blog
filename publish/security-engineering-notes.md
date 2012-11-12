Title: Security Engineering Notes
Date: 2010-07-31 16:46:06
Tags: computing

<em>Here are are some rough notes I put together as part of revision for a uni course.</em>
<h1>Security Engineering</h1>
<ul>
	<li>CIA
<ul>
	<li>Confidentiality</li>
	<li>Integrity</li>
	<li>Availability</li>
</ul>
</li>
	<li>Some other attributes include,
<ul>
	<li>Authenticity</li>
	<li>Privacy</li>
	<li>Accountability,</li>
	<li>Non-reputability</li>
	<li>Receipt-freeness (for voting systems)</li>
</ul>
</li>
	<li>Methods of attack
<ul>
	<li>Brute Force</li>
	<li>Deception/Social Engineering</li>
	<li>Calculated attack on a 		vulnerability</li>
	<li>Insider (both intentional and unintentional/accidental)
<ul>
	<li>Mitigation techniques: Keeping logs and conducting audits could. Also least privilege to prevent accidental insider attacks.</li>
</ul>
</li>
	<li>Chance (right place at the right 		time)</li>
	<li>Accidental</li>
</ul>
</li>
	<li>Reliable systems (protect against 	random failures)</li>
	<li>Secure systems (protect against 	targeted deliberate attacks)</li>
	<li>Assets which need to be protected
<ul>
	<li>Tangible (eg. documents)</li>
	<li>Non-tangible (eg. reputation)</li>
</ul>
</li>
</ul>
<ul>
	<li>Security Engineering: Protecting <strong>assets</strong> against <strong>threats</strong>.</li>
	<li>Kerckhoff's Principle - "the security of the cryptosystem must not depend on keeping secret the crypto-algorithm. It must depend only on keeping secret the key."
<ul>
	<li>Because, its often easier to change the key after a compromise or possible compromise than changing the algorithm,</li>
	<li>and it's usually also harder to keep the algorithm secret (can be reverse-engineered or bought) compared to the key</li>
</ul>
</li>
</ul>
<h2>Crypto</h2>
<ul>
	<li><strong>Code</strong> (hidden meaning, ie. A spy using a phase that seems normal, but actually has some other hidden meaning)</li>
	<li>Plaintext -&gt; E(encryption key) Ciphertext -&gt; D(decryption key)</li>
	<li><strong>Symmetric-key cryptography</strong> - Encryption key can be calculated from the decryption key and vice versa (usually they are the same though). The sender and receiver must agree upon the keys first. Two types,
<ul>
	<li><strong>Stream Ciphers</strong> - operate one bit at a time (eg. RC4)</li>
	<li><strong>Block Ciphers</strong> - operate on a group of bits at a time (eg. DES and AES/Rijndael)
<ul>
	<li>Block chaining is used to make each block of cipher text depend on <strong>all</strong> the previous blocks of plaintext.</li>
</ul>
</li>
</ul>
</li>
	<li><strong>Public-key Cryptography</strong> (asymmetric-key) - public and private keys where you cannot (or is really hard to) calculate one from the other. (eg. RSA)
<ul>
	<li>One problem is that an attacker can use an adaptive chosen plaintext attack, where they encrypt a large number of messages using the target's public key. A fix is to pad messages with a long random string.</li>
	<li>Can be used to do <strong>digital signatures</strong>. (encrypt your message M (though in practice a one way hash is used instead) using your private key, verifiers just decrypt using your public key as only someone with the private key (ie. you) could have successfully encrypted M)
<ul>
	<li><strong>Birthday attack</strong> - find two messages that have the same hash but only differ by say spaces at the end of the line, and some other key part like dollar amount. Then when you get Alice to sign document A, the signature will be the same for document B (as Alice is signing the hashes and the hashes are the same)</li>
</ul>
</li>
	<li><strong>Public Key Infrastructure</strong> - how to ensure that Bob's public key really belongs to the Bob you want to communicate with (tries to solve the key distribution problem).
<ul>
	<li>Public Key Certificates</li>
	<li>Certificate distribution (X.509, GPG)</li>
</ul>
</li>
</ul>
</li>
	<li>Most cryptosystems use public-key crypto just to exchange the symmetric key shared key, and then both parties this shared key to communicate with symmetric-key crypto. These systems are known as <strong>hybrid cryptosystems</strong>. This is done for mainly two reasons,
<ul>
	<li>public-key algorithms are usually around 1000 times <strong>slower</strong> than symmetric algorithms.</li>
	<li>public-key algorithms are <strong>vulnerable to chosen-plain text attacks</strong>.</li>
</ul>
</li>
	<li>Cryptanalysis is about determining the plaintext from the key.</li>
	<li>Authentication</li>
</ul>
Extra notes from Schinder 2nd Ed.
<ul>
	<li>Types of attacks,
<ul>
	<li>cipher-text only</li>
	<li>known plain text</li>
	<li>chosen plain text</li>
	<li>adaptive chosen plain text (you can modify your next choice based on the results of the previous choice)</li>
	<li>chosen cipher text</li>
	<li>known key relationship</li>
	<li>rubberhose (get the person who knows the key to reveal it)</li>
</ul>
</li>
	<li><strong>Substitution ciphers </strong>
<ul>
	<li>Simple (monoalphabetic cipher)
<ul>
	<li>A → 2
B → 3
C → 1
...</li>
</ul>
</li>
	<li>Homophonic (where multiple options available such as 5,2 one is chosen at random)
<ul>
	<li>A → 5,2
B → 1,3
C → 4
...</li>
</ul>
</li>
	<li>Polygram
<ul>
	<li>ABC → 819
ABB → 234
ABA → 567
ACA → 587
...</li>
</ul>
</li>
	<li>Polyalphabetic (simple substitution cipher, but the mapping also depends on the position of the input character in the plain text), examples include,
<ul>
	<li>Caesar cipher - shift each letter forward or back by K. eg. if K = 1, A ﻿→ B, B → C ...</li>
	<li>rot13</li>
	<li><strong>Vigenere cipher</strong> - <strong>align the repeated key K over the plaintext
</strong></li>
</ul>
</li>
	<li>These can be attacked by statistical cryptanalysis of the letter frequency</li>
</ul>
</li>
	<li><strong>Transposition Ciphers</strong> - the order of the characters is changed (rotor machines such as the Enigma did this)
<ul>
	<li>eg. write across, but read down
<pre>HELLO
WORLD
THISI
SSOME</pre>
encrypts to HWTSEOHSLRIOLLSMODIE</li>
</ul>
</li>
	<li><strong>One time pads</strong></li>
	<li><strong>One-way hash function</strong> (also known as message digest, fingerprint, cryptographic checksum)
<ul>
	<li>pre-image → <em>f(x)</em> → hash value</li>
	<li>A hash function is collision free if it is hard (ie. at best becomes brute force) to generate two pre-images with the same hash value.</li>
	<li>Also a single bit change in the pre-image should on average change half of the bits in the hash value.</li>
</ul>
</li>
	<li>Types of <strong>random sequences</strong>,
<ul>
	<li>Pseudo-random (looks random, good for applications like writing an random AI game agent)</li>
	<li>Cryptographically secure pseudo-random (unpredictable)</li>
	<li>True randomness (cannot be reproduced with the same inputs)</li>
</ul>
</li>
	<li><strong>Zero-knowledge proofs</strong> - proving to someone that you know something without revealinfg them what that something is. Two types,
<ul>
	<li>Interactive</li>
	<li>Non-interactive</li>
</ul>
</li>
</ul>
<h3>RSA</h3>
Choose two primes <em>p</em> and <em>q</em> and let <em>n</em> = <em>pq</em>. Choose <em>e</em> such that <em>e</em> and (<em>p</em> - 1)(<em>q</em> - 1) are relatively prime (ie. no common factor and both prime numbers). Let d be a solution of ed <span style="text-decoration:underline;">=</span> 1 mod (p-1)(q-1). Public key $latex K = (e,n)$, private key $latex K^{-1} = (d,n)$.

$latex E_K(M) = M^e \mod n$

$latex D(M) = E_{K^-1}(M) = M^d \mod n$
<h2>Access Control</h2>
<ul>
	<li>"An access control policy is a description of <strong>who</strong> may access <strong>what</strong> (and <strong>how</strong>)."</li>
	<li><strong>Principle of least privilege</strong> - "The powers that an agent in the system is given should be the minimum that they need to have to play their assigned role in the system."</li>
	<li>AC can be done at many levels (eg. hardware, os, database, network, application...)</li>
	<li>Managing <strong>Subjects</strong>, <strong>Objects</strong> and <strong>Operations</strong>. (can use Groups or Roles to classify subjects)
<ul>
	<li><strong>Access Control Matrix</strong> (central database of all objects, subjects and operations permitted)</li>
	<li><strong>Access Control List</strong> (store permissions with object)</li>
	<li><strong>Capabilities</strong> (store permissions with subject)</li>
</ul>
</li>
	<li><strong>Mandatory AC</strong> - central entity sets the AC.
<ul>
	<li>Multi-level (eg. top secret, secret, unclassified labels...)
<ul>
	<li>Bell-LaPadula - no read up, no write down.</li>
</ul>
</li>
</ul>
</li>
	<li><strong>Discretionary</strong> - each object has an owner, and the owner sets the AC.</li>
	<li>Commercial Policies
<ul>
	<li>Chinese Wall - eg set up rules like if a subject can access X they cannot access Y.</li>
	<li>Dual Control - need two people together to modify X, they cannot do it on their own.</li>
</ul>
</li>
	<li>Reference Monitor - some entity that sits between the subjects and objects to implement some policy (relies on trusted entity)</li>
</ul>
<h2>Elections</h2>
You want your elections to be,
<ul>
	<li>verifiable - so the voter can check that their vote was indeed counted (and if possible check that everyone else's vote was counted correctly)</li>
	<li>correct - votes are counted correctly and the results match calculated correctly</li>
	<li>secret (ie. no one knows how you vote, so that you cannot be coerced)</li>
	<li>coercion free (so you want to be recite free)</li>
</ul>
(additional notes, but don't really need to know for exam)
<ul>
	<li>True Democracy (like the Greek's assembly)</li>
	<li>Representative Democracy (where we vote in someone to represent us)</li>
	<li>Participatory Democracy (where we represent ourself an all have equal say)</li>
</ul>
<ul>
	<li>Australian Federal Elections are subject to the Mafia problem. Because we have preferential voting that is you can order your preferences that means that for n candidates there are n! ways of voting. So if there are enough candidates and few enough people you can coerce a person into using a specific voting pattern which you can then verify that they indeed did vote that way.</li>
	<li>An alternative attack would be to obtain a blank voting paper, fill it in the way you want it to be give it to someone and tell them to submit it and return you a blank one. Although the attacker won't know if the victim has scribbled it out to make it invalid, but at least the attacker has prevented someone from voting.</li>
</ul>
<h2>Security Architecture</h2>
Security Design Principles:
<ul>
	<li>Economy of Mechanism - keep things simple</li>
	<li>Fail-safe defaults</li>
	<li>Complete Mediation - every access request checked</li>
	<li>Open design, ie. Kerckhoffs' Principle: Keep the key secret, don't rely on keeping the algorithm secret.</li>
	<li>Separation of Privilege</li>
	<li>Least Privilege</li>
	<li>Least common mechanism</li>
	<li>Psychological acceptability</li>
</ul>
Defence in depth - use many layers of security (or many security perimeters in layers)
<h2>Human Factors</h2>
<ul>
	<li>People are trusting</li>
	<li>People are lazy (to read the manual or change factory defaults)</li>
	<li>People are greedy (will exploit the system if given the chance)</li>
	<li>People are forgetful (forget to revoke access when terminating employees)</li>
	<li>People are selfish</li>
	<li>People are stick-beaks (eg. Medicare employees accessing client data for personal interest)</li>
</ul>
Some strategies for reducing the risk,
<ul>
	<li>logging of insider's actions</li>
	<li>honeypots for insiders (eg. fake web server running on the network, or fake data in the database)</li>
	<li>security policy for staff to follow</li>
</ul>
<h2>Risk</h2>
Risk is not something I would have thought to be in a security course, but now that I think about it there are few if any bullet proof systems, so there is always some risk.

Whether it be secure communication (there is always some risk that an eavesdropper cracks your cryto and reads the message, so its important to weigh up those risks to decide if its worth sending the message in the first place), or be it running a web server (you cannot be sure that your web server doesn't have bugs, or even if you have verified the code to be matching the vulnerability free specification other things can happen like, has your CPU been verified to be bug free, are you sure that a cosmic ray won't flip a bit and subsequently create a vulnerability). So weighing up the risks involved is important to decide how much time and effort you devote to securing a system, or how the system is designed to work.
<h3>Business Risk Concepts</h3>
<ul>
	<li>Exposure - what is the worst case scenario (or loss)</li>
	<li>Volatility - how predictable is the loss</li>
	<li>Probability - how likely is that loss</li>
</ul>
<h3>Degree of Risk</h3>
<pre>       &lt;-- Probability --&gt;
High Exposure/  |  High Exposure/         /\
Low Probability |  High Probability       ||
-----------------------------------    Exposure
Low Exposure/   |  Low Exposure/          ||
Low Probability |  High Probability       \/</pre>
Exposure - how widespread is the system?
Probability - how easy is it to exploit the system, and how great is the incentive to do so (which relates to how valuable the assets you are protecting are)?
<h3>Risk management</h3>
<ul>
	<li>Example. The risk of viruses; the mitigation strategy may be to use anti-virus detection, but the residual risk is zero-day attacks.</li>
	<li><strong>Carry the risk</strong> - just accept it.</li>
	<li><strong>Balancing the risk</strong> - eg. data backups at multiple locations, distributed servers at multiple locations (perhaps even running different systems, so for instance if you want to keep your web site up and running you may load balance between both a Linux box running Apache, and a windows box running IIS, so that an attack found in one is not likely to be present in the other so the attacker can't take both offline with the one attack.)</li>
	<li><strong>Mitigate it</strong> - reduce the risk</li>
	<li><strong>Transfer the risk</strong> - eg. in finance, get insurance</li>
</ul>