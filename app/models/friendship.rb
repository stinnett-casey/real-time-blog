class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
  validates_presence_of :user_id, :friend_id

  def self.exists?(user, friend)
    where(user: user, friend: friend).count > 0
  end

  def self.request(user, friend)
    unless user == friend or Friendship.exists?(user, friend)
      friendship = user.friendships.new(friend: friend)
      friendship.save
    end
  end
end
