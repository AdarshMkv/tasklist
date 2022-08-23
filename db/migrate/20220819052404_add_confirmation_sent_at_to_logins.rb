class AddConfirmationSentAtToLogins < ActiveRecord::Migration[7.0]
  def change
    add_column :logins, :confirmation_sent_at, :datetime
  end
end
