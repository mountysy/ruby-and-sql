# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

contact1 = Contact.find_by({"first_name" => "Tim"})
contact2 = Contact.find_by({"first_name" => "Craig"})
puts contact1.inspect
puts contact2.inspect

salesperson1 = Salesperson.find_by({"first_name" => "Ben"})
puts salesperson1.inspect

activity = Activity.new
activity["ocurred_at"] = "Jan23"
activity["notes"] = "sold 100 computers"
activity["contact_id"] = contact1["id"]
activity["salesperson_id"] = salesperson1["id"]
activity.save

activity = Activity.new
activity["ocurred_at"] = "Feb23"
activity["notes"] = "sold 100 pencils"
activity["contact_id"] = contact1["id"]
activity["salesperson_id"] = salesperson1["id"]
activity.save

activity = Activity.new
activity["ocurred_at"] = "Mar23"
activity["notes"] = "sold 100 apples"
activity["contact_id"] = contact2["id"]
activity["salesperson_id"] = salesperson1["id"]
activity.save
puts activity.inspect
puts "there are #{Activity.all.count} activities"

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

puts "Activities between #{salesperson1["first_name"]} and #{contact1["first_name"]}:"
activity = Activity.where({"salesperson_id" => salesperson1["id"], "contact_id" => contact1["id"]})
for act in activity
    puts act["notes"]
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

puts "#{salesperson1["first_name"]}'s activities:"
ben_act = Activity.where({"salesperson_id" => salesperson1["id"]})
puts ben_act.inspect
for ben in ben_act
    ben_contact = Contact.find_by({"id" => ben["contact_id"]})
    first_name = ben_contact["first_name"]
    last_name = ben_contact["last_name"]
    puts "#{first_name} #{last_name} - #{ben["notes"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

puts "#{salesperson1["first_name"]}'s activities:"
ben_act = Activity.where({"salesperson_id" => salesperson1["id"]})
puts ben_act.inspect
for ben in ben_act
    ben_contact = Contact.find_by({"id" => ben["contact_id"]})
    first_name = ben_contact["first_name"]
    last_name = ben_contact["last_name"]

    company = Company.find_by({"id" => ben_contact["company_id"]})
    company_name = company["name"]

    puts "#{first_name} #{last_name} (#{company_name}) - #{ben["notes"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

salesperson2 = Salesperson.find_by({"first_name" => "Erick"})
erick_act = Activity.where({"salesperson_id" => salesperson2["id"]})
puts "#{salesperson1["first_name"]} #{salesperson1["last_name"]}: #{ben_act.count} activities"
puts "#{salesperson2["first_name"]} #{salesperson2["last_name"]}: #{erick_act.count} activities"

#aternative:
salespeople = Salesperson.all
for salesperson in salespeople
    act = Activity.where({"salesperson_id" => salesperson["id"]})
    puts "#{salesperson["first_name"]} #{salesperson["last_name"]}: #{act.count} activities"  
end

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
