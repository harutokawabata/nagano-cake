class Genre < ApplicationRecord
  has_many :items
  belongs_to :home
end
