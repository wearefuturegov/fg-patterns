class ChangeOrganisationTypeToOrganisationTypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :services, :organisation_type, :organisation_types
  end
end
