Title: Human Computer Interaction Notes
Date: 2009-12-02 00:00:47
Tags: comp3511,computing

<em>These notes are based around my COMP3511 course.</em>
<h2>Interaction Design (+Scenarios)</h2>
<ul>
	<li>Interaction Design is about creating user experiences that enhance and augment the way people work, communicate, and interact.1</li>
	<li>Interaction Design has a much wider scope than Human Computer Interaction. ID is concerned with the theory and practice of designing user experiences for any technology or system, whereas HCI has traditionally been focused on/surrounding humans and computers specifically.</li>
	<li>Interaction Design involves understanding the <strong>requirements</strong>.</li>
	<li>Requirements can be <strong>functional</strong> (what should it do) or<strong> non-functional </strong>(what are the constraints). The usability principles (heuristics) fit into the non-functional requirements.</li>
	<li><strong>User Profiles</strong> are a set of persona's. A persona is a short description of a fictional user.</li>
	<li>Scenarios
<ul>
	<li>Activity Scenario (narrative based on user's requirements)
<ul>
	<li>Used at the beginning of the design process.</li>
	<li>Who, When, What, Why</li>
	<li>Not technical/no specific details (re: does not presuppose the interface)</li>
	<li>From the users perspective</li>
</ul>
</li>
	<li>Use Case Scenario (narrative of how the user uses the interface to fulfil their goal)
<ul>
	<li>Include the users goals but focus on the user/computer interaction (re: talk about the technology)</li>
	<li>Basically is a description of the use case diagram.</li>
	<li>Do these scenarios after you figure out the requirements</li>
	<li>Different users would have different use cases, we can show this with a use case diagram which shows the actors and the various use case's that they encounter.</li>
</ul>
</li>
	<li>Task Scenario
<ul>
	<li>Used when running a usability test. ie. give the participant a scenario before giving them a task to give them context.</li>
</ul>
</li>
	<li>When describing a scenario, give the users goals, their context and situation. Use a narrative form.</li>
</ul>
</li>
</ul>
Cooper et al. describe the process of interaction design as,
<ol>
	<li>Identifying needs and establishing requirements for the user experience.</li>
	<li>Developing alternative designs that meet those requirements.</li>
	<li>Building interactive versions of the designs so that they can be communicated and assessed.</li>
	<li>Evaluating what is being built throughout the process and the user experience it offers.</li>
</ol>
Scenarios are narratives about named people with an age. We need some background to understand where they are coming from (for instance their cultural background (eg. the US uses MM/DD/YYYY but Australia uses DD/MM/YYYY)). We try to remove incorrect assumptions about what we think a certain group of people are like. The scenario should explain their motivations and their goals.
<h2>Usability</h2>
Usability is all about producing things which are usable. Where something is usable when it meets these usability goals, however you should work out which goals are most important for the problem and focus on those first.
<h3>Usability Goals</h3>
<ul>
	<li>easy to learn</li>
	<li>easy to remember how to use</li>
	<li>effective to use</li>
	<li>efficient to use</li>
	<li>safe to use</li>
	<li>have good utility (providing the right kind of functionality to allow the user to achieve their goal)</li>
</ul>
<h3>User Experience Goals</h3>
<ul>
	<li>satisfying</li>
	<li>fun</li>
	<li>helpful</li>
	<li>motivating</li>
	<li>universal access (accessibility)</li>
</ul>
<h3>Heuristics (Usability Principles)</h3>
<ul>
	<li><strong>visibility of system status</strong> (eg. busy mouse icon)</li>
	<li><strong>match between system and real world</strong> (includes interface metaphors. eg. files and folders concept, "speak the user's language" (avoid gargon that users may not understand))</li>
	<li><strong>user control and freedom</strong> (includes letting the user cancel/exit. eg. can pause/cancel file transfers)</li>
	<li><strong>consistency and standards </strong>(eg. consistent terminology, consistent workflows,  common look and feel, GUI toolkits. eg. GNOME/GTK+)</li>
	<li><strong>help and documentation</strong></li>
	<li><strong>help users recognise, diagnose and recover from errors</strong> (tell users what the problem was, why it happened and some possible solutions, using plain English. eg. recover from trash)</li>
	<li><strong>error prevention</strong> (eg. move to trash first)</li>
	<li><strong>recognition rather than recall </strong>(GUI applications menu as opposed to CLI)</li>
	<li><strong>flexibility and efficiency of use</strong> (eg. keyboard shortcuts (helpful for experts, but hidden from novices))<strong>
</strong></li>
	<li><strong>aesthetic and minimalist (uncluttered) design </strong>(maybe put rarely used info into a help page/manual rather than in the interface)<strong>
</strong></li>
</ul>
<h3>Design Principles</h3>
<ul>
	<li>visibility</li>
	<li>feedback (can be audio, visual...)</li>
	<li>affordances (clues on how to use. eg. ⋮∶affords grabable)</li>
	<li>consistency (includes look and feel consistency)</li>
	<li>mapping
<ul>
	<li>eg. which light switch controls which light</li>
</ul>
</li>
	<li>constraints
<ul>
	<li>logical (eg. grey out menu options that are not allowed)</li>
	<li>physical (eg. you can't plug a USB cable into a VGA port, c.f. you can put a DVD in a CD player)</li>
	<li>cultural</li>
</ul>
</li>
</ul>
When designing a system we need to consider,
<ul>
	<li>who are the users,</li>
	<li>how will the product be used,</li>
	<li>where will the product be used</li>
</ul>
<h2>Identifying Needs</h2>
<h2>Requirements</h2>
When testing an interface with users/test participants, give them a high level goal and observe how they go about doing it. Don't give them specific instructions.
<p style="padding-left:30px;">Use Scenario 1: For each task identified (or major tasks, or particularly special tasks if many tasks are defined), write a description of how that user would accomplish the task <em>independent</em> of how they would complete it within the application.</p>
<p style="padding-left:30px;">Use Case 1: If a use scenario has been implemented, include a matching use case which describes how the task use scenario can be completed in the application. There may be branching or multiple ways to complete the task, and this is a good way to document it.</p>
To test if something is a requirement just ask, "If I remove this, will the product still fulfil its purpose?"
<h1>Design Conceptualisation</h1>
A conceptual model is a high-level description of how a system is organised and operates. --Johnson and Henderson, 2002, p. 26

I like to think of it as this. The person coding the web browsers understands that when the users types in a URL and presses enter an HTTP GET request is sent and the response is received and the HTML is processed and displayed. There are many technical interactions and details that are happening here. But the conceptual model of this is what the average non-technical uses thinks is happening. They just have some kind of model in their head that they type the URL hit enter and get the web site displayed. Its just an abstraction of what is going on.

<strong>Interface metaphors</strong> are used as they can help the user understand and determine how an interface works. We try to use them for this purpose but just using the metaphor directly can have some negative affects (eg. if your designing a radio application for desktop PC's, it may not be a good idea to just show an image of a real radio as the UI). We don't want to use the metaphor to an extent that it breaks the design principles.

A classic example of a conceptual framework is that of the relation between the design of a conceptual model and the user's understanding of it. In this framework there are three components, (Sharp et al., 2006)
<ul>
	<li>The <strong>designer's model</strong> - the model the designer has how how the system works (or how it <strong>should</strong> work)</li>
	<li>The <strong>system image</strong> - how the systems actual workings are portrayed to the users through the interface, manuals, etc. (or how it is <strong>presented</strong>)</li>
	<li>The<strong> user's model</strong> - how the user understands the system works (or how it is <strong>understood</strong>)</li>
</ul>
[caption id="attachment_772" align="aligncenter" width="361" caption="Conceptual Framework (from Norman, 1988)"]<a href="/blog/attachments/2009/09/conceptual_framework1.png"><img class="size-full wp-image-772" title="conceptual_framework" src="/blog/attachments/2009/09/conceptual_framework1.png" alt="Conceptual Framework (from Norman, 1988)" width="361" height="220" /></a>[/caption]

The designers job is to create the system image so that the users will invoke the same conceptual model as the designer's.
<ul>
	<li>"A good conceptual model allows us to predict the effects of our actions." (Norman, 1988)</li>
</ul>
The interface could be made more transparent so the user can see the details of how the system works, but this is not always desirable as it may cause confusion. Also many users may not want to know all the gory details, nor should they have to know the actual implementation in order to use the system.
<ul>
	<li>You can conceptualise how a user interacts with a system in terms of their goals and what they need to do to achieve those goals.</li>
</ul>
<ul>
	<li>You can try to give the user a more correct mental model of the system by giving useful feedback based on their input and providing help and documentation.</li>
</ul>
<h1>Prototyping</h1>
<ul>
	<li>Can do low fidelity or high fidelity prototypes.</li>
	<li>Could use paper mockups of screens, storyboards, electronic mockup, electronic prototype...</li>
	<li>Make sure you iterate.</li>
	<li>"the best way to get a good idea is to get lots of ideas" --Linus Pauling</li>
</ul>
<h2>Using A Design Diary</h2>
<ul>
	<li>Brainstorm ideas</li>
	<li>Sketch interface mockups</li>
	<li>Sketch storyboards/work flow diagrams</li>
</ul>
<h2>Wireframes</h2>
Here is an example wireframe.

[caption id="" align="aligncenter" width="445" caption="Example Wireframe from https://wiki.ubuntu.com/DesktopExperienceTeam/KarmicBootExperienceDesignSpec"]<a href="https://wiki.ubuntu.com/DesktopExperienceTeam/KarmicBootExperienceDesignSpec?action=AttachFile&amp;do=view&amp;target=OS-selector-secondary.png"><img title="OS-selector-secondary.png" src="https://wiki.ubuntu.com/DesktopExperienceTeam/KarmicBootExperienceDesignSpec?action=AttachFile&amp;do=get&amp;target=OS-selector-secondary.png" alt="Example Wireframe from (https://wiki.ubuntu.com/DesktopExperienceTeam/KarmicBootExperienceDesignSpec)" width="445" height="313" /></a>[/caption]

Another paper prototype with a slightly higher fidelity.
<p style="text-align:center;"></p>


[caption id="attachment_850" align="aligncenter" width="450" caption="An example paper prototype (from https://wiki.ubuntu.com/SoftwareStore)."]<a href="/blog/attachments/2009/10/1-0-department-search.jpg"><img class="size-full wp-image-850 " title="1.0-department-search" src="/blog/attachments/2009/10/1-0-department-search.jpg" alt="An example paper prototype (from https://wiki.ubuntu.com/SoftwareStore)." width="450" height="321" /></a>[/caption]
<h2>Issues Table</h2>
<ul>
	<li>In this course we list the issues vertically and the participants horizontally.</li>
	<li>Prioritise and group the issues. (Maybe use affinity diagramming for the grouping)</li>
</ul>
<h2>Usability Testing</h2>
<ul>
	<li>Can do interviews, questionnaires, usability tests (best to run a dry run of these before you start testing on many people), interaction logging...</li>
	<li>The purpose of a usability test is to gather feedback from potential users about usability issues as well as ensuring that an interface can be used and works as expected.</li>
	<li>Testing should be done throughout the whole process during prototyping, beta versions, and deployed applications.</li>
	<li>According to Nielson you only need test an interface with 5 people to find 80% of the issues (see Nielsen, <em>Usability Engineering</em>, p173) (however to publish research 5 is statistically too small so you should use at least 10).</li>
	<li>When planning a test you need to define scenarios and tasks as well as deciding what to test and how to collect the results. Its a good idea to have goals that try to measure the success of the usability principles.</li>
	<li>Test the parts of your interface which would be used most, as well as any particularly difficult to design aspects first.</li>
</ul>
There are some legal and ethical issues to consider. The participant,
<ul>
	<li>needs to sign a consent form for you to run a test with them.</li>
	<li>is free to stop participating at any time.</li>
	<li>must be made aware of how you are observing them and what will be done with data collected. eg. is the session been recorded on video, audio, observed by people, screen captured...? Will the data be antonymous, will the anonymous results be published...</li>
	<li>should be made aware that you are testing the software, not them.</li>
</ul>
During a Usability Test,
<ul>
	<li>Avoid leading questions. (eg. try to avoid "How much do you like this interface?")</li>
	<li>When running a usability test be careful not to bias your results. For example instead of asking the user "How would do X? when there is a button "Do X", give them a scenario which has a goal and ask them how they would go about achieving this with the interface.</li>
	<li>You want the participant to "think aloud" so that you know what they are thinking when they are using the interface you are testing.</li>
	<li>If users are struggling give them a hint, if that doesn't help explain the expected solution and move on, but note that they needed assistance when recording the test data.</li>
	<li>If a task is difficult for the user, its not the users fault, its the interface's!</li>
	<li>We want to record things like time to complete the task, amount and nature of errors encountered and by who... Things that address the usability principles. You should record both these quantitative measurements and any qualitative things that you observer or the participant mentions.</li>
</ul>
After the Testing,
<ul>
	<li>Collate feedback and test data (Use an issues table to record the usability issues that the participants had.)</li>
	<li>Group issues and prioritise them.</li>
	<li>When analysing results consider,
<ul>
	<li>If a user is asked to compare two interfaces, the results may bias towards the second as they learn from their first experience.
<ul>
	<li>Can try to solve this by getting some participants to do A then B, and others B then A.</li>
</ul>
</li>
	<li>Observing how a user interacts with an interface may change how they interact with it. (ie. they may have done things differently if they were at home, without you scrutinising their every move).
<ul>
	<li>We can try to avoid this by making the participants feel comfortable and reinforcing that we are not testing them we are testing the interface. Assure them that there are no incorrect users and don't avoid doing things just because you know we are taking notes.</li>
</ul>
</li>
</ul>
</li>
</ul>
<h3>Usability Testing</h3>
When actually running a usability test you should follow a usability test plan. The test plan just details what the test facilitator should do during the test.

The usability testing procedures we used in this course are:
<ol>
	<li>Explain procedures (think aloud, data collection methods in use...)</li>
	<li>Make sure they agree and sign a consent for before proceeding (you keep one, they keep one)</li>
	<li>Run a pre-test questionnaire (used to generate a participant profile) (this helps to give you an idea on their experience level, as well as any background they may have in using similar interfaces before, as these affect how the participant performs) (best to get the participant to do this a few days before the test so that you can focus on specific tasks.)</li>
	<li>Introduce scenario</li>
	<li>Run through tasks</li>
	<li>Ask any post test questions</li>
	<li>Do they have any extra comments/debriefing</li>
	<li>Thank them for their time</li>
</ol>
<h3>Interviews</h3>
<ul>
	<li>Can be open ended (participant gives longer responses which may include their reasoning) or closed (list of options participant chooses from).</li>
	<li>When running an interview give,
<ul>
	<li>An introduction to the interview (what you are doing, purpose, what happens to the responses, how it it being recorded)</li>
	<li>Warm-up questions</li>
	<li>Main section. (use a logical sequence)</li>
	<li>Cool-off questions</li>
	<li>Closing remarks.</li>
</ul>
</li>
</ul>
<h3>Questionnaires</h3>
<ul>
	<li>Participant Sample (You probably want a sample representative of your users/target users).</li>
</ul>
<h2>User Centred Design Process</h2>
The UCD process is all about focusing on the users and tasks. It also means iterate your designs often. The development is driven by users needs rather than technical concerns.

More specifically Gould and Lewis (1985) give three principles,
<ul>
	<li>Early focus on users and tasks.</li>
	<li>Empirical measurement.</li>
	<li>Iterative design.</li>
</ul>
<h3>Affinity Diagramming</h3>
<ul>
	<li>This is where we collect ideas and then group them.</li>
	<li>Don't use pre-defined groups, make them up as you start sifting through the ideas.</li>
	<li>The idea is to organise a bunch of individual ideas into a hierarchy.</li>
</ul>
<h3>Card Sorting</h3>
<ul>
	<li>Get a bunch of people to sort cards with some idea/concept/whatever into categories and then compare how they were sorted by the different participants.</li>
</ul>
<h3>Software Lifecycles</h3>
<ul>
	<li>Waterfall</li>
	<li>W-model</li>
	<li>Spiral</li>
	<li>Rapid Application Development</li>
	<li>Star Model (evaluation at each step)</li>
	<li>ISO 13407 (the HCI model goes around in a circle and only exits when satisfactory)</li>
</ul>
<h1>Cognitive Load Theory</h1>
Cognition is what goes on in our brains. It includes cognitive processes such as,
<ul>
	<li>attention
<ul>
	<li>Some techniques are particularly good at grabbing attention (flashing, moving, colourful or large things). But these should be used sparingly.</li>
</ul>
</li>
	<li>perception and recognition
<ul>
	<li>Gestalt principles of perceptual organisation. ie. we group things by proximity, similarity, closure, symmetry and continuity.

[caption id="attachment_852" align="aligncenter" width="389" caption="Gestalt principles of perceptual grouping. (a. you see two groups the left two and the right two; b. you see the objects in columns rather than rows; c. you group the () braces together; d. you see two curves and most people probably see the same two curves (as opposed to sharp edges that meet at the vertex))"]<a href="/blog/attachments/2009/10/gestalt.png"><img class="size-full wp-image-852" title="gestalt" src="/blog/attachments/2009/10/gestalt.png" alt="Gestalt principles of perceptual grouping" width="389" height="96" /></a>[/caption]</li>
</ul>
</li>
	<li>memory</li>
	<li>learning</li>
	<li>reading, speaking and listening</li>
	<li>problem-solving, planning, reasoning  and decision-making.</li>
	<li>automatic processes
<ul>
	<li><a href="http://en.wikipedia.org/wiki/Stroop_effect">Stroop effect</a> (trying to say the colour not the words  eg. <span style="color:#339966;">red</span> <span style="color:#3366ff;">green</span> <span style="color:#ff0000;">blue</span> orange <span style="color:#339966;">purple</span> <span style="color:#ffa500;">pink</span>) is due to this.</li>
</ul>
</li>
</ul>
<h2>Some Cognitive Load Theory</h2>
<ul>
	<li>Huge long term memory (with the information stored in schemas) and a limited working memory.
<ul>
	<li>Schemas allow us to bypass our working memory limitations by chunking information.</li>
	<li>They allow us to ignore the huge amount of detail coming from our senses and instead integrate with our existing schemas.</li>
	<li>eg. its much easier to memories SYSTEM than YSMSTE.</li>
	<li>"Automated Schemas"</li>
</ul>
</li>
	<li>Worked Examples instead of Means-Ends Analysis
<ul>
	<li>Its better to give new users a quick (or even not so quick) 'worked example' of how the interface works/how to use it, than just let them work it out for themselves.</li>
</ul>
</li>
	<li>Split Attention Effect
<ul>
	<li>e.g. "See figure 16.", "Refer to page 26"... "Requires us to mentally integrate information that is physically split."<sup>2</sup></li>
	<li>Solution physically integrate the material.</li>
	<li>Don't force users to recall information from a previous screen.</li>
</ul>
</li>
	<li>The Redundancy Effect
<ul>
	<li>It is better to emit redundant information as it generally just confuses people.</li>
</ul>
</li>
	<li>Expertise Reversal Effect
<ul>
	<li>Its better to assume your audience is novice, if you are unsure.</li>
	<li>Novices need lots of worked out examples</li>
</ul>
</li>
	<li>Reduce Search (reduces cognitive load)
<ul>
	<li>By using a consistent layout</li>
	<li>By reducing visual clutter</li>
</ul>
</li>
	<li>Diagrams can reduce cognitive load</li>
	<li>Modality Effect
<ul>
	<li>Separate working memories for audio and visual senses.</li>
	<li>Therefore presenting information visually and auditory allows for a greater total working memory size than just presenting it visually or auditory. (But we should consider users with disabilities, so taking advantage of this by presenting some information visually and some auditory is not a good idea)</li>
</ul>
</li>
</ul>
<h3>Some HCI Applications</h3>
<ul>
	<li>The Training Wheels approach involves restricting the features of an interface for novices until they become more experienced when advanced features are enabled.</li>
</ul>
<h2>Memory</h2>
(From a psychologists perspective).
<ul>
	<li>Memory is based on your context (eg. night, bed, tired, dark, dream... ask them to recall they will often recall sleep even though it was never mentioned). Give context before this will help them store the information and recall it better.</li>
</ul>
<ul>
	<li>Miller's theory is that only 7± 2 chunks of information can be held in short-term memory at any one time. (But this doesn't mean say, only put seven items in any menu or something like that. This is only for short-term memory and when the information comes and goes, not when it can be rescanned.)</li>
</ul>
<h3>Long Term Memory</h3>
<p style="text-align:left;"></p>

<p>&nbsp;</p>

[caption id="attachment_794" align="aligncenter" width="360" caption="A Taxonomy of Memory"]<a href="/blog/attachments/2009/09/taxonomy_of_memory.png"><img class="size-full wp-image-794 " title="taxonomy_of_memory" src="/blog/attachments/2009/09/taxonomy_of_memory.png" alt="A Taxonomy of Memory" width="360" height="306" /></a>[/caption]
<h4>Explicit and Implicit Memory</h4>
<blockquote>"Imagine that you learn a list of items and are then required to recall or recognise them. This memory test would be accompanied by conscious awareness that you were remembering. Imagine that a considerable time later, a test of recall or recognition revealed no memory for the items. However if you were given the original list to relearn there would probably be some savings in learning time (i.e. you would take less time to learn the list the second time, oven though you were not aware of your memory of the items). This is the distinction between <strong>explicit memory</strong>, in which remembering is accompanied by either intentional or involuntary awareness of remembering, and<strong> implicit memory</strong>, in which remembering is not accompanied by awareness (Graf &amp; Schacter 1985; Schacter 1987)." -- (Walker, "Chapter 9: Memory, Reasoning and Problem Solving". pg. 262 (sorry I don't have the title))</blockquote>
Not really related, but a good thing to hear a text book say,
<blockquote>"Finally, some long-enduring memories are for passages that our teachers have drulled into us... The Interesting thing about these memories is that they are preserved as they were memorised, in a very literal form, in exact wordings (Rubin, 1982). The memory code is not transferred from literal to semantic. In fact, the words are often remembered mechanically, with almost no attention to their meaning." --(Walker, "Chapter 9: Memory, Reasoning and Problem Solving". pg. 267 (sorry I don't have the title))</blockquote>
<ul>
	<li>The method of loci.</li>
</ul>
<ul>
	<li>The context that a memory is encoded, affects its retrieval. For example you may not initially recognise your neighbour on the train, as you are not used to seeing them there.</li>
	<li>People are much better at recognising things than recalling things.</li>
</ul>
<h3>Obstacles to Problem Solving</h3>
<ul>
	<li>Unwarranted Assumptions
<ul>
	<li>Example given in class. "A man married 20 women. yet he broke not laws and never divorced. How? He was a priest."</li>
</ul>
</li>
	<li>Seeing new Relationships</li>
	<li>Functional Fixedness
<ul>
	<li>Being an expert at a system, you may not see things that novice would see.</li>
	<li>You avoid using things in an unconventional way.</li>
	<li>New users may find new or unintended uses of the system.</li>
</ul>
</li>
	<li>The Set Effect
<ul>
	<li>We may not notice that two similar problems actually need to be solved in different ways.</li>
</ul>
</li>
</ul>
<h2>External Cognition</h2>
People use external representations to extend or support ones ability to perform cognitive activities. For example, pens and paper, calculators, etc. We do this to,
<ol>
	<li>reduce memory load
<ul>
	<li>eg. post-it notes, todo lists. But the placement of say post-it notes is also significant.</li>
</ul>
</li>
	<li>offload computation
<ul>
	<li>eg. pen and paper to solve a large arithmetic problem (the mechanical kind).</li>
</ul>
</li>
	<li>annotate
<ul>
	<li>modifying or manipulating the representation to reflect changes</li>
</ul>
</li>
</ol>
<h2>Experts vs. Novices</h2>
<ul>
	<li>What distinguishes an expert is their large knowledge based stored in schemas.</li>
	<li>Declarative (facts)/procedural(how to do) knowledge.</li>
	<li>Skill acquisition.
<ul>
	<li>Cognitive stage (learn facts, encode declarative knowledge),</li>
	<li>Associative stage (procedural knowledge),</li>
	<li>Autonomous stage.</li>
</ul>
</li>
	<li>Novices tend to use ends-means analysis (uses a lot of trial and error) to solve problems. Experts tend to use their knowledge stored in schemas to apply and solve the problem (ie. past experience).</li>
	<li>In software can have novice (limited functionality) and expert modes. (Could be different applications Photoshop Elements vs. Photoshop Pro, or just hide advanced functionality for novices by default eg. &gt;Advanced Options which is clicked to show more functions.)</li>
	<li>IDEA: Could provide popup hints  to intermediate users to explain expert functions (eg. what's going on under the hood), or more advanced options (eg. keyboard shortcuts).</li>
</ul>
<h2>Visual Design</h2>
<ul>
	<li>Alignment of items in an interface  makes it easier for users to scan the screen.</li>
	<li>Grouping</li>
	<li>Colour</li>
	<li>Gestalt Principles</li>
	<li>Menu design (see ISO 9241)</li>
</ul>
<ul>
	<li>Three types of icons,
<ul>
	<li>similar (eg. a file for a file object)</li>
	<li>analogical (eg. scissors for cut)</li>
	<li>arbitrary (eg. X for delete or close)</li>
</ul>
</li>
	<li>Can add text near the icon to make it easier for newbie's, but allows expert to ignore and just glance at the icon.</li>
</ul>
<h1>Internationalisation</h1>
Differences around the world,
<ul>
	<li>character set</li>
	<li>keyboard layout</li>
	<li>text direction</li>
	<li>language</li>
	<li>icons</li>
	<li>date, time, currency</li>
	<li>calendars</li>
</ul>
Internationalisation (i18n) refers to designing and developing a software product to function in multiple locales. Localisation (L10n) refers to modifying or adapting a software product to fit the requirements of a particular locale. This could include translating text, changing icons, modifying layout (eg. of dates).<sup>5</sup>

A locale is a set of conventions affected or determined by human language and customs, as defined within a particular geo-political region. These conventions include (but are not necessarily limited to) the written language, formats for dates, numbers and currency, sorting orders, etc.<sup>5</sup>
<h1>Accessibility</h1>
<ul>
	<li>Some clauses relating to requirements for Australian web sites in <em>Australian Disability Discrimination Act</em> (1992).</li>
</ul>
<h1>Quantification</h1>
<ul>
	<li>A way to test an interface different to usability testing.</li>
</ul>
<h2>GOMS</h2>
<ul>
	<li>Goals (eg. send an email)</li>
	<li>Operators (eg. double click)</li>
	<li>Methods (recalling what to do/how to do)</li>
	<li>Selection Rules (deciding which method to use to achive the goal)</li>
</ul>
<h2>Keystroke Level Model</h2>
<ul>
	<li>K (keying) - 0.2s - Press (and release) a keyboard key, or click the mouse. (Click and drag is only 1/2 K).</li>
	<li>P (pointing) - 1.1s - Moving the mouse to a location on the screen.</li>
	<li>H (homing) - 0.4s - Moving between the keyboard and mouse.</li>
	<li>M (mentally preparing) - 1.35s - Preparing.</li>
	<li>R (computer responding) - Waiting for the computer to respond.</li>
</ul>
<h2>Fitt's Law</h2>
<ul>
	<li>In the field of ergonomics research.</li>
	<li>Used to predict the time to move the cursor to a target.</li>
	<li>$latex T = A + B \times log_2 \left ( \frac{D}{S} + 1 \right )$</li>
	<li>A and B are experimentally determined constants. (Raskin used A = 50, B = 150).</li>
	<li>D is distance between start and target</li>
	<li>S is size of target (just dealing with 1 dimension here).</li>
	<li>Lesson: The larger the target the faster one can move the mouse to that location.</li>
	<li>Lesson: Targets at the edge of the screen have an infinite size, so they are fast to navigate to. (Problem, if you use edge bindings a lot your mouse will physically move further and further away, so the user may need to be constantly picking it up moving it)</li>
</ul>
<h1>References</h1>
[1] Sharp, Rodgers, Preece. (2006) <em>Interaction Design: Beyond human computer interaction</em>. 2nd Ed.

[2] Marcus, Nadine. (2009) <em>COMP3511 Cognitive Load Theory Lecture Slides</em>.

Woo, Daniel. (2009) <em>COMP3511 Lecture Slides</em>.

Norman, Donald. (1988) <span id="btAsinTitle"><em>The Design of Everyday Things</em>.</span>

[5] <a href="http://www.mozilla.org/docs/refList/i18n/">http://www.mozilla.org/docs/refList/i18n/</a>