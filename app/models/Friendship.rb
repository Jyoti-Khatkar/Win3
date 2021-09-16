class Friendship < ApplicationRecord
  belongs_to :sent_by, class_name: 'User', foreign_key: 'sent_by_id'
  belongs_to :sent_to, class_name: 'User', foreign_key: 'sent_to_id'
  scope :friends, -> { where('status =?', 1 )}
  scope :not_friends, -> { where('status =?', 2) }
  scope :pending, -> { where('status =?', 0) }
  
end
