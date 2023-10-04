class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'を入力してください' }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'を入力してください' }
         validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'をカナ入力してください' }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'をカナ入力してください' }
         validates :birth_day, presence: true

        
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: '半角英数字を含めて6文字以上で設定ください' 
         
end
