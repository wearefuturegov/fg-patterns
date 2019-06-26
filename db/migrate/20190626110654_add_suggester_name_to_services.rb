class AddSuggesterNameToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :suggester_name, :string
  end
end
