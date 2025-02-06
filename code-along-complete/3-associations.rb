# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along-complete/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company

# first query to find the row in companies for Apple
apple = Company.find_by({ "name" => "Apple" })

contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tim@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federighi"
contact["email"] = "craig@apple.com"
contact["company_id"] = apple["id"]
contact.save

amazon = Company.find_by({ "name" => "Amazon" })

contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save

puts "There are #{Company.all.count} companies"
puts "There are #{Contact.all.count} contacts"

# 2. How many contacts work at Apple?

# first query to find the row in companies for Apple
apple = Company.find_by({ "name" => "Apple" })

# next, query to find all rows in contacts with relationship to Apple
# "talk" to the contacts table using the Contact model:

apple_contacts = Contact.where({ "company_id" => apple["id"] })
puts apple_contacts.inspect

puts "Contacts at Apple: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

# loop through contacts
for contact in apple_contacts
  # read each contact row's first_name and last_name columns
  first_name = contact["first_name"]
  last_name = contact["last_name"]
  # display the first_name and last_name
  puts "#{first_name} #{last_name}"
end
