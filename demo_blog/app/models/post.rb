# Model Post Code
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
end
