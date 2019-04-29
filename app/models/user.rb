class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :join_table_private_message_users
  has_many :received_messages, class_name: "PrivateMessage", through: :join_table_private_message_users  #,class_name: "JoinTablePrivateMessageUser"
  has_many :comments
  has_many :likes
end
