class AddUsersToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :sender
    add_reference :chatrooms, :recipient
    add_foreign_key :chatrooms, :users, column: :sender_id, primary_key: :id
    add_foreign_key :chatrooms, :users, column: :recipient_id, primary_key: :id
  end
end
