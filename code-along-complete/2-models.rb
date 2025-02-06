# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along-complete/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"
# **************************

# - Insert, read, and update company data in database

# 1a. check out the schema file
# 1b. check out the model file

# "talk" to the companies table using the Company model:

# Number of rows in companies table
puts "companies: #{Company.all.count}" # companies: 0

# 2. insert new rows in companies table

# Insert a row
new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://www.apple.com"
new_company.save

# pay attention to the SQL in the log

# How many rows are in the companies table?
puts "companies: #{Company.all.count}" # companies: 1

# Insert another row
new_company2 = Company.new
new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2.save

# pay attention to the SQL in the log

# How many rows are in the companies table?
puts "companies: #{Company.all.count}" # companies: 2

# Insert another row
new_company3 = Company.new
new_company3["name"] = "Twitter"
new_company3["city"] = "San Francisco"
new_company3["state"] = "CA"
new_company3.save

# pay attention to the SQL in the log

# How many rows are in the companies table?
puts "companies: #{Company.all.count}" # companies: 3

# 3. query companies table to find all row with California company

# All rows in companies table
all_companies = Company.all
puts all_companies.inspect

# All rows in companies table where state is "CA"
california_companies = Company.where({ "state" => "CA" })
puts california_companies.inspect
puts "companies in cali: #{california_companies.count}" # companies in cali: 2

# 4. query companies table to find single row for Apple

# Single row in companies table where name is "Apple"
# apple = Company.where({ "name" => "Apple" })[0]
apple = Company.find_by({ "name" => "Apple" })
puts apple.inspect

# 5. read a row's column value

puts apple["url"]
# OR
# puts apple.url

# 6. update a row's column value

amazon = Company.find_by({ "name" => "Amazon" })
amazon["url"] = "https://www.amazon.com/"
# OR
# amazon.url = "https://www.amazon.com/"
amazon.save

# 7. delete a row

twitter = Company.find_by({ "name" => "Twitter" })
twitter.destroy

# How many rows are in the companies table?
puts "companies: #{Company.all.count}" # companies: 2
