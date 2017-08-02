class CreateFundings < ActiveRecord::Migration[5.0]
  def change
    create_table :fundings do |t|
      t.float :amount
      t.string :object
      t.float :application_fee, default: 0.25
      t.boolean :capture, default: true
      t.string :description, default: nil
      t.string :destination
      t.string :transfer_group
      t.string :on_behalf_of
      t.string :source
      t.string :currency, default: 'USD'
      t.string :metadata, default: '{}'
      t.string :stripe_id
      t.integer :user_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
