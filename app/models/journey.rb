class Journey < ActiveRecord::Base
  belongs_to :traveler
  validates :traveler_id, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :location, presence: true, length: {minimum: 5, maximum: 150}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> {order(updated_at: :desc)}
    
    private
    def picture_size
      if (picture.size > 5.megabytes)
        errors.add("Should be less than 5MB")
      end
    end
end