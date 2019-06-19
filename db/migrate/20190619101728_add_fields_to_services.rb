class AddFieldsToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :organisation_type, :string
    add_column :services, :suggester_email, :string
    add_column :services, :suggester_organisation, :string
  end
end
