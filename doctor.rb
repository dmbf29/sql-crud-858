require 'sqlite3'
DB = SQLite3::Database.new("test_doctors.db")
DB.results_as_hash = true

class Doctor
  def initialize(attributes = {})
     @id = attributes[:id]
     @name = attributes[:name]
     @age = attributes[:age]
     @specialty = attributes[:specialty]
  end

  def save
    # if it exists already, it will update
    # if it's brand new, it will create
    # puts "Inserting into the DB..."
    # puts "INSERT INTO table ()"
    # puts "VALUES ..."
    # DB.execute('write query here..')
    DB.execute("INSERT INTO doctors (name, age) VALUES (?, ?)", 'Luis', 42)
    # get the ID from the DB and give it to the instance
    #   DB.last_insert_row_id => gives the id that we just assigned to Luis
  end

  def self.all
    p rows = DB.execute('SELECT * FROM doctors')
    # iterate over the hashes and turn them into instances (which iterator to return an array??)
    rows.each do |row|
      # (Dont actually display, create an instance)
      p row['name']
    end
  end
end

# class method
Doctor.all

# luis = Doctor.new(name: 'Luis', age: 45, specialty: 'General')

# we want to save Luis' information into the database
# luis.save

# user goes onto the page, fills out the form
# gives names as 'Luis; DROP TABLE doctors'
# name = 'Luis; DROP TABLE doctors'
# luis = Doctor.new(name: name)

# DB.execute('DELETE FROM doctors WHERE id = 1')
# ? is a placeholder for a value only
# DB.execute('DELETE FROM doctors WHERE id = ?', 1)
