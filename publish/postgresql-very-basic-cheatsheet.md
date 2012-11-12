Title: PostgreSQL Very Basic Cheatsheet
Date: 2009-05-05 09:06:08
Tags: comp3311,computing

<em>(Wrote this a few weeks ago when I knew nothing. Indented into my brain now. Should have published earlier or just trashed the post as it seems too simple now. So instead I'll update it when I find out some new neat tricks.)</em>

List of databases:
$ psql -l

To open one of them,
$ psql MyDatabase

To see what is in the database (list of relations),
mydb=# \d

To examine a specific table,
mydb=# \d TableName

Can execute SQL,
mydb=# select * from Table;

Can edit SQL in an editor from within PSQL,
mydb=# \e

To quit,
mydb=# \q

To load a schema from a file
$ psql mydb -f /home/foo/bar

Also from the shell,
$ pg_dump -O myDB &gt; file
(-O means no ownership information is outputed)

On my server configuration (default for ubuntu) you can restart the PostgreSQL service using,
$ sudo /etc/init.d/postgresql-8.3 restart