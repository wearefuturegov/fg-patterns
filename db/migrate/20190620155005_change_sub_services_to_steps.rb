class ChangeSubServicesToSteps < ActiveRecord::Migration[5.2]
  def change
    rename_column :services, :sub_services, :steps
  end
end
