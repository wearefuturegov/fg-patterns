class AddTransactionalBooleanToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :transactional, :boolean
  end
end
