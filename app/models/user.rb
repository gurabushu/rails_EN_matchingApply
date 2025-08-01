class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Active Storage for profile image
  has_one_attached :profile_image

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, length: { maximum: 500 }
  validates :skills, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }, allow_nil: true
  
  # Profile image validation
  validate :profile_image_format

  private

  def profile_image_format
    return unless profile_image.attached?

    unless profile_image.content_type.in?(['image/jpeg', 'image/jpg', 'image/png', 'image/gif'])
      errors.add(:profile_image, 'はJPEG, PNG, GIF形式のファイルを選択してください')
    end

    if profile_image.byte_size > 5.megabytes
      errors.add(:profile_image, 'は5MB以下のファイルを選択してください')
    end
  end
end
