class CreateBackers < ActiveRecord::Migration[5.0]
  def change
    create_table :backers do |t|
      t.string :username
      t.string :location
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
