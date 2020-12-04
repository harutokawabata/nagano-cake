class Home < ApplicationRecord
  has_many :genres
  scope :created_today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
end
