class CreateCreators < ActiveRecord::Migration[5.0]
  def change
    create_table :creators do |t|
      t.string :username
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
