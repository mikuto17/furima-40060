class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, presence: true,
            length: { minimum: 6 },
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英数字の組み合わせで入力してください" }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true, if: :password_required?
  validates :first_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/,message: "は全角文字で入力してください" }
  validates :last_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/,message: "は全角文字で入力してください" }
  validates :first_kana, presence:true,
            format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで入力してください" }
  validates :last_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true          
end
