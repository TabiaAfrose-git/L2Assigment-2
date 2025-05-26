1. What is PostgreSQL?

PostgreSQL is a powerful, open-source object-relational database system widely used for enterprise-level performance and reliability.

 * It is:
    * Open Source
    * Object-Relational
    * SQL Support
    * Flexibility and Extensibility

* It supports a large part of the SQL standard and offers many modern features:
    1. complex queries
    2. foreign keys
    3. triggers
    4. updatable views
    5. transactional integrity

* PostgreSQL can be extended by the user in many ways, for example by adding new
    1. data types
    2. functions
    3. operators
    4. aggregate functions
    5. index methods

* Use Cases:
    1. Web applications
    2. Mobile applications
    3. Data warehousing
    4. Geospatial applications
    5. Financial applications


2. How can you modify data using UPDATE statements?

firstly,
    The UPDATE statement starts with the UPDATE keyword followed by the name of the table you want to modify.

then,
    The SET clause follows, listing the columns you want to update and the new values you want to assign to them.
    **You can update one or more columns in a single UPDATE statement.

finaly,
    The WHERE clause is used to specify a condition that determines which rows will be updated. If you omit the WHERE clause, all rows in the table will be updated.

Example:
    UPDATE employees
    SET department = 'Marketing'
    WHERE id = 1;


3. Explain the GROUP BY clause and its role in aggregation operations.

    The SQL GROUP BY clause is a powerful tool used to organize data into groups based on shared values in one or more columns.

    Example:
        SELECT column1, function_name(column2) FROM table_name
        GROUP BY column1, column2

    IN this code select "column1, function_name(column2)" from "table_name" table and make a group by "column1, column2". The GROUP BY clause divides a table into distinct groups based on the values of specified columns.

    * The combination of GROUP BY and aggregate functions allows you to generate concise and informative summaries of your data. This is particularly useful for creating reports, dashboards, and analyzing trends.


4. What is the difference between the VARCHAR and CHAR data types?

    * CHAR(n) (Fixed-Length Character):

        1. Stores exactly n characters.

        2. If you store a shorter string than n, it pads the value with spaces to fill the length.

        3. Best for data that always has the same length, like fixed-size codes or IDs.

        Example: CHAR(5) storing 'cat' actually stores 'cat ' (with 2 spaces).

    * VARCHAR(n) (Variable-Length Character):

        1. Stores up to n characters.

        2. Only uses as much space as the actual string length (plus some overhead).
        No padding with spaces.

        3. Best for data with variable length, like names, emails, descriptions.

        Example: VARCHAR(5) storing 'cat' stores exactly 'cat' (3 characters).


5. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

    * Primary Key:

        Example:
        CREATE TABLE ranger (
            ranger_id SERIAL PRIMARY KEY,
            name VARCHAR(50)
        );

        # Why use it?
            To make sure each record is unique and easily searchable.

    * Foreign Key (FK):

        Example:
        CREATE TABLE sighting (
            sighting_id SERIAL PRIMARY KEY,
            ranger_id INT REFERENCES ranger(ranger_id),
            species_id INT,
            sighting_time TIMESTAMP
        );

        # Why use it?
            To link tables together — for example, associating sightings with rangers.

    * Summary Table:
        Concept	Primary Key	Foreign Key
        Purpose	Uniquely identifies each record	Links to primary key in another table
        Uniqueness	Must be unique	Can have duplicates
        Null values	Not allowed	Allowed (unless restricted)
        Number per table	One	Multiple allowed

    * Quick analogy:
        . Primary Key: Think of it as a person's unique ID number.
        . Foreign Key: Think of it as a reference to someone else's ID number, linking them together.

