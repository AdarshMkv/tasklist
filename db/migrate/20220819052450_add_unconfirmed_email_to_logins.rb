class AddUnconfirmedEmailToLogins < ActiveRecord::Migration[7.0]
  def change
    add_column :logins, :unconfirmed_email, :string
  end
end
