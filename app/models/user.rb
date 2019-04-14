class User < ApplicationRecord
  has_many :games
  validates :username, length: { is: 3 }
end
