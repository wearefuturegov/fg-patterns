class AddSubServicesToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :sub_services, :text
  end
end
