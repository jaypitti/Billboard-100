class Artist < ApplicationRecord
  has_many :songs, dependent: :destory
end
