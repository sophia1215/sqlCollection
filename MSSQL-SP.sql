
/*
Changing dateformat on a SQL Server DB and not on whole server to dd/mm/yyyy
https://stackoverflow.com/questions/755849/changing-dateformat-on-a-sql-server-db-and-not-on-whole-server-to-dd-mm-yyyy

You can change the default date format per user by selecting the default language for that user in SQL Management Studio > Security > Logins > {user properties} > Default language.

And you can see the date format for each language with
*/

EXEC sp_helplanguage




