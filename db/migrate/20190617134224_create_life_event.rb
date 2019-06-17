class CreateLifeEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :life_events do |t|
      t.string :name
    end
  end
end
