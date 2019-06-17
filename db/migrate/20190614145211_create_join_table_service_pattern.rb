class CreateJoinTableServicePattern < ActiveRecord::Migration[5.2]
  def change
    create_join_table :services, :patterns do |t|
      t.index [:service_id, :pattern_id]
    end
  end
end
