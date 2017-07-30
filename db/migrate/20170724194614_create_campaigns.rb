class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.float :funding_goal
      t.float :raised
      t.datetime :deadline
      t.boolean :goal_met?
      t.attachment :image
      t.integer :creator_id

      t.timestamps
    end
  end
end
