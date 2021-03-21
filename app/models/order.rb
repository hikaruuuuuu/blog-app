class Order
  include ActiveModel::Model
  attr_accessor :f_name, :l_name, :f_name_kana, :l_name_kana, :postal_code, :prefecture_id, :city, :building_number, :building_name, :phone_number, :article_id, :user_id, :user_deal_id, :token


  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一ー-龥々]+\z/, message: 'は全角で入力してください', allow_blank: true } do
    validates :f_name
    validates :l_name
  end

  with_options presence: true, format: { with: /\A[ぁ-ん]+\z/, message: 'はひらがな入力してください', allow_blank: true } do
    validates :f_name_kana
    validates :l_name_kana
  end

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は、-を含む半角数字で入力してください', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :building_number
    validates :building_name
    validates :phone_number, format: { with: /\d/, message: 'は半角数字で入力してください', allow_blank: true },length: { maximum: 11, message: '11桁以内で入力してください', allow_blank: true }
    validates :article_id
    validates :user_id
    validates :token
  end


  def save
    user_deal = UserDeal.create(article_id: article_id, user_id: user_id)
    Address.create(f_name: f_name, l_name: l_name, f_name_kana: f_name_kana, l_name_kana: l_name_kana, postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_number: building_number, building_name: building_name, phone_number: phone_number, user_deal_id: user_deal.id)
  end
end