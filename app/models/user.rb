class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presance: true
  validates :last_name, presance: true
  validates :first_name, presance: true
  validates :last_name_katakana, presance: true
  validates :first_name_katakana, presance: true
  validates :birthday, presance: true
end
