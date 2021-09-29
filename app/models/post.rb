class Post < ApplicationRecord

	belongs_to :user
	has_many :comments
	has_many :likes, as: :likeable
	validates :title, presence: true
end
