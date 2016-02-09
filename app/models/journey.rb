class Journey < ActiveRecord::Base
  belongs_to :traveler
  validates :traveler_id, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :location, presence: true, length: {minimum: 5, maximum: 150}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}
end