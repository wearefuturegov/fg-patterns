class AddStatusToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :status, :string
  end
end
