class AddOauthExpiresAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :oauth_expires_at, :datetime
  end
end
