class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :join_table_gossip_tags, dependent: :destroy
  has_many :tags, through: :join_table_gossip_tags
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true,length: { in: 3..25}
  validates :content, presence: true
end
