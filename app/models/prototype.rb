class Prototype < ApplicationRecord
has_many :comments
belongs_to :user
has_many :comments

has_one_attached :image

validates :image, presence: true
validates :title, presence: true
validates :catch_copy, presence: true
validates :concept, presence: true
validates :user, presence: true

def new
end

def create
end

end