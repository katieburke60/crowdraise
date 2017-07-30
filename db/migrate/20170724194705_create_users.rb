class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :username
      t.string :token
      t.string :password_digest
      t.string :publishable_key
      t.string :secret_key
      t.string :currency, :default => 'USD'
      t.string :stripe_account_type
      t.string :stripe_user_id
      t.string :customer_id
      t.string :refresh_token

      t.timestamps
    end
  end
end
