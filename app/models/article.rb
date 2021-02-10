class Article < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end

  validates :buy_setting, inclusion: {in: [true, false]}
  # validates :buy_setting  boolean型にしているため、presence: trueだと、falseのときにエラーになる

  validates :price, numericality: { only_integer: true, with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  validates_inclusion_of :price, in: 100..9_999_999, message: 'は¥100〜9,999,999に設定してください'

  belongs_to :user
  has_one_attached :image
end
