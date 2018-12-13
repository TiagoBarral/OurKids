class Child < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  after_create :check_avatar

  has_many :familyChildren
  has_many :families, through: :familyChildren
  has_many :parents, through: :families, class_name: :User
  has_many :expenses

  def check_avatar
    self.remote_photo_url = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544626317/default-avatar.png' if self.photo.file.nil?
  end

  def total
    total = []
    expenses.each do |e|
      total << e.amount
    end
    total.sum
  end
end
