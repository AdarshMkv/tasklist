class AddConfirmedAtToLogins < ActiveRecord::Migration[7.0]
  def change
    add_column :logins, :confirmed_at, :datetime
  end
end
