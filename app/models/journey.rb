class Journey < ActiveRecord::Base
  belongs_to :traveler
  validates :traveler_id, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :location, presence: true, length: {minimum: 5, maximum: 150}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}
  mount_uploader :picture, PictureUploader
  
    validate :picture_size
    
    private
    def picture_size
      if (picture.size > 10.megabytes)
        errors.add("Should be less than 10MB")
      end
    end
end