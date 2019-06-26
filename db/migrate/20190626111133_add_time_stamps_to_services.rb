class AddTimeStampsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :created_at, :datetime, null: false
    add_column :services, :updated_at, :datetime, null: false
  end
end
