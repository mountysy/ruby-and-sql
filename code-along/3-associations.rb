# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

puts "Contacts: #{Contact.all.count}"

apple = Company.find_by({"name" => "Apple"})
puts apple.inspect

contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tcook@apple.com"
contact["company_id"] = apple["id"]
contact.save
puts contact.inspect

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Garth"
contact["email"] = "cgarth@apple.com"
contact["company_id"] = apple["id"]
contact.save
puts contact.inspect

amazon = Company.find_by ({"name" => "Amazon"})
contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jbezos@amazon.com"
contact["company_id"] = amazon["id"]
contact.save
puts contact.inspect


# 1. insert new rows in the contacts table with relationship to a company

# 2. How many contacts work at Apple?

apple_contacts = Contact.where ({"company_id" => apple["id"]})
puts "Apple peeps: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

for employee in apple_contacts
    first_name = employee["first_name"]
    last_name = employee["last_name"]
    puts "#{first_name} #{last_name}"
end