class Like < ApplicationRecord
  belongs_to :gossip
  # belongs_to :comment, optional: true
  belongs_to :user
end
