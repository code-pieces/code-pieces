class AddUserIdToSocialAccounts < ActiveRecord::Migration
  def change
    add_column :social_accounts, :user_id, :integer
  end
end
