class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  
  # フォロー関係を作成するメソッド
  def self.create_relationship(follower, followed)
    create(follower: follower, followed: followed)
  end

  # フォロー関係を削除するメソッド
  def self.destroy_relationship(follower, followed)
    relationship = find_by(follower: follower, followed: followed)
    relationship&.destroy
  end

  # フォローしているかどうかを確認するメソッド
  def self.following?(follower, followed)
    exists?(follower_id: follower.id, followed_id: followed.id)
  end
  
end
