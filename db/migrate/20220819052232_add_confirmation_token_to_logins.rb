class AddConfirmationTokenToLogins < ActiveRecord::Migration[7.0]
  def change
    add_column :logins, :confirmation_token, :string
  end
end
