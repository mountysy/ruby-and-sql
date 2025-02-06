class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string "ocurred_at"
      t.string "notes"
      t.integer "salesperson_id"
      t.integer "contact_id" 
      t.timestamps
    end
  end
end
