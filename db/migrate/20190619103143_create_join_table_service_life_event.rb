class CreateJoinTableServiceLifeEvent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :services, :life_events do |t|
      t.index [:service_id, :life_event_id]
    end
  end
end
