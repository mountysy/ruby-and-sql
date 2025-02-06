# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along-complete/1-migrations.rb

# ------------------------------------------------
# Note: no code is needed in this file.
# Execute steps below in terminal and other files.
# ------------------------------------------------

# Lab 1: Migrations
# - The database should now include tables for Company and Contact.
#   And the app/models directory should include models for both as well.
#   Next, we'll add models and tables for the Salesperson entity.  And
#   lastly, for the Activity relationship (the join model between Salesperson
#   and Contact).  Follow the steps below for Salesperson, and then repeat
#   for Activity.

# 1. in terminal, generate a model and table for ______
# rails generate model _____

# 2. open newly generated files

# 3. in the db/migrate file, add relevant columns matching our domain model

# 4. in terminal, execute the migration file
# rails db:migrate

# 5. check the schema to confirm the change
