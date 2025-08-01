class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :img_url, presence: true, format: { with: /\Ahttps?:\/\/.*\.(?:png|jpg|jpeg|gif)\z/i }
  validates :introduction, length: { maximum: 500 }
  validates :skills, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }, allow_nil: true
end
