# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along-complete/1-migrations.rb

# ------------------------------------------------
# Note: no code is needed in this file.
# Execute steps below in terminal and other files.
# ------------------------------------------------

# - Add model and table for the Company entity in our domain model

# 1. in terminal, generate the model and table for Company
# rails generate model Company

# 2. open newly generated files

# 3. in the db/migrate file, add relevant columns matching our domain model
# t.string "name"
# t.string "city"
# t.string "state"
# t.string "url"

# 4. in terminal, execute the migration file
# rails db:migrate

# 5. check the schema to confirm the change
# pay attention to the SQL in the log

# - Add model and table for the Contact entity in our domain model

# 1. in terminal:
# rails generate model Contact

# 2. add to migration file:
# t.string "first_name"
# t.string "last_name"
# t.string "email"
# t.integer "company_id"

# 3. in terminal:
# rails db:migrate
