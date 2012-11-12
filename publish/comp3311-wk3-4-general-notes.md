Title: COMP3311 - Wk3-4 General Notes
Date: 2009-04-10 03:21:18
Tags: comp3311

<h2>Constraint Checking</h2>
If you use the keyword CONSTRAINT, you also need to provide a name for the constraint. However, it is permitted to omit both the keyword CONSTRAINT and the constraint name. In other words constraint definitions can be either
<pre>CONSTRAINT constraint_name CHECK ( expression )</pre>
or just
<pre>CHECK ( expression )</pre>
With respect to the expression,
<pre>x = NULL --this is always false
x IS NULL --returns true if x is null, and false otherwise</pre>
<ul>
	<li>You should add as many constraints to the database as needed for the data to make sense and is valid. Its probably bad practice to push this off to the application programming level in say PHP. There is probably a lot more to this though.</li>
</ul>
<h2>Queries</h2>
Standard paradigm for accessing DB from app.code:
<pre>-- establish connection to DBMS
db = dbConnect("dbname=X user=Y passwd=Z");
query = "select a,b from R,S where ... ";
-- invoke query and get handle to result set
results = dbQuery(db, query);
-- for each tuple in result set
while (tuple = dbNext(results)) {
-- process next tuple
process(val(tuple,'a'), val(tuple,'b'));
} dbClose(results);</pre>
<ul>
	<li>The important point here is as much as possibly you should try to grab as much data as you need from one SQL query with one call to the DB. Rather than just grabbing the whole database and getting the parts you need in the rest of your program (eg. PHP). I can see how this method would be tempting, but I can also see that its a bad approach.</li>
</ul>
<h2>Views</h2>
<pre>create view <em>name</em> as select ...</pre>
This makes a "virtual table" called name that you can use in your subsequent SQL queries, but the table will dissapear when the connection is closed (or at least this is when I think it dissapears).
<h2>pg_dump</h2>
<pre>pg_dump dbname &gt; file</pre>
This will dump the whole database (in SQL format) to a file. Use -o to ommit the ownership data.
<h2>Enforcing Case</h2>
SQL is case insensitive, to enforce case use double quotes. eg. select name as "Foo" from bar;
<h2>Foreign Keys</h2>
Just because an attribute in a foreign key does not automatically imply that it is not null. It may be NULL. If  you want the attribute to never be NULL you must add NOT NULL.