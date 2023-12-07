class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英数字の組み合わせで入力してください" }
  validates :first_name, presence: true,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "は全角文字で入力してください" }
  validates :last_name, presence: true,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "は全角文字で入力してください" }
  validates :first_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで入力してください" }
  validates :last_kana, presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true
  
has_many :products
has_many :boughts

end
