class AddSlugToPatterns < ActiveRecord::Migration[5.2]
  def change
    add_column :patterns, :slug, :string
  end
end
