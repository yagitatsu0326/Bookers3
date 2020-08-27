class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image#refileにより画像をアップロードする為

  validates :name, presence: true, length: {in: 2..50}
  validates :introduction, length: {maximum: 50}

  has_many :books , dependent: :destroy #bookテーブルと紐つけ
end
