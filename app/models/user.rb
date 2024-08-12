class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana,  presence: true
  validates :birthday,        presence: true

  validate :password_complexity

  private

  def password_complexity
    return if password.blank?

    # 半角英字と数字の両方が含まれているかをチェックする正規表現
    return if password.match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i)

    errors.add :password, 'は半角英数字を含めて設定してください'
  end
end
