class Account < ApplicationRecord
  has_secure_password
  has_one :backer

  # def self.from_token(token)
  #   account_id = Auth.decode(token)
  # end
  #
  # def self.authenticate(username, password)
  #   account = Account.find_by(username: username)
  #   account && account.authenticate(password)
  # end
end
