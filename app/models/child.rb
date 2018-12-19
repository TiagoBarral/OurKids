class Child < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # after_create :check_avatar

  enum gender: [:Male, :Female, :Other]

  has_many :familyChildren
  has_many :families, through: :familyChildren
  has_many :parents, through: :families, class_name: :User
  has_many :childExpenses
  has_many :expenses, through: :childExpenses

  def check_avatar
    if self.photo.file.nil?
      if self.gender == "Male"
        self.remote_photo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcQD83XNYGbjA4ruZq6njvCP7sbLhNWZzi-zLaM6ml4JwbjddG'
      elsif self.gender == "Female"
        self.remote_photo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK6-xNXb8tyZYgr2SKhi9YJ-3aO_KCmNPPT1bcHhjQzcW4Gdmd'
      else
        self.remote_photo_url = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544626317/default-avatar.png'
      end
    end
  end

  def total
    total = []
    expenses.each do |e|
      subtotal = e.amount / e.children.size
      total << subtotal
    end
    total.sum
  end
end
