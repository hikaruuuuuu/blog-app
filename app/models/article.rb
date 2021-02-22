class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end

  validates :buy_setting, inclusion: {in: [true, false], message: "が選択されていません"}
  # validates :buy_setting  boolean型にしているため、presence: trueだと、falseのときにエラーになる

  # validates :price, presence: true, if: :not_free?  これでifの制限つけれる

  with_options presence: true, if: :not_free? do
    validates :price, numericality: { only_integer: true, with: /\A[0-9]+\z/, message: 'は半角数字で入力してください', allow_blank: true }
    validates_inclusion_of :price, in: 100..9_999_999, message: 'は¥100〜9,999,999に設定してください', allow_blank: true
    # number_fieldにしているため、数字以外は入力できないので今回は不要
  end
  
  def not_free?
    buy_setting == true
  end

  def previous
    Article.where("id > ?", self.id).order("id DESC").first
  end

  def next
    Article.where("id < ?", self.id).order("id DESC").first
  end

end