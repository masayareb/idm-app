class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バリデーション
  validates :name, presence: true
  validates :affiliation, presence: true
  validates :admin, inclusion: [true, false]
  #半角6~12文字で英大文字・英小文字・数字それぞれ１文字以上含む
  validates :password,on: :create ,format: { with:/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/, message: "Password is invalid. Include both letters and numbers"}
  #半角英数字のみ
  validates :employee_number, presence: true,uniqueness: true, format: { with:/\A[a-z0-9]+\z/i }

end
