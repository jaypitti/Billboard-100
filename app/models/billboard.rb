class Billboard < ApplicationRecord
  has_many :songs, dependent: :destroy
end
