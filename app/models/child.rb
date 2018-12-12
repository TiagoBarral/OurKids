class Child < ApplicationRecord
  before_create :check_avatar

  mount_uploader :photo, PhotoUploader
  has_many :familyChildren
  has_many :families, through: :familyChildren
  has_many :parents, through: :families, class_name: :User
  has_many :expenses

  def check_avatar
    self.remote_photo_url = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544626317/default-avatar.png' if self.remote_photo_url.nil?
  end
end
