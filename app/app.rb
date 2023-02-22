require "pry"
require "active_record"

# TODO: CONNECT TO THE DATABASE
ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/school.db"
)


# TODO: CREATE TABLE
create_tm_table = <<-SQL
    CREATE TABLE IF NOT EXISTS mentors(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        UNIQUE(email)
    )
SQL

ActiveRecord::Base.connection.execute(create_tm_table)

# TODO: Create class that associates with the db table
class Mentor < ActiveRecord::Base
end

# TODO: VIEW METHODS AVAILABLE FOR TABLE (methods)
# an array with all the methods available
#puts Mentor.methods

# TODO: COLUMN NAMES (column_names)
pp Mentor.column_names

# TODO: CREATE NEW RECORD (create)
#Mentor.create(name: "Kelvin", email: "kelvin@gmail.com")

# TODO: VIEW ALL RECORDS (all)
pp Mentor.all

# TODO: FIND BY ID (find)
# can only search by id
pp Mentor.find(1)

# TODO: FIND BY GIVEN CONDITIONS (find_by)
# can search using id and other variables
pp Mentor.find_by(name: "Kelvin")

# TODO: UPDATE RECORDS (save)
kelvin = Mentor.find_by(name: "Kelvin")
kelvin.email = "kelvin123@gmail.com"
# updates to the database
kelvin.save()
