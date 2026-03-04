class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :body, length:{minimum: 10}

  has_one_attached :image
end
