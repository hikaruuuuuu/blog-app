class Order
  include ActiveModel::Model
  attr_accessor :f_name, :l_name, :f_name_kana, :l_name_kana, :postal_code, :prefecture_id, :city, :building_number, :building_name, :phone_number, :article_id, :user_id, :user_deal_id, :token

  def save
    user_deal = UserDeal.create(article_id: article_id, user_id: user_id)
    Address.create(f_name: f_name, l_name: l_name, f_name_kana: f_name_kana, l_name_kana: l_name_kana, postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_number: building_number, building_name: building_name, phone_number: phone_number, user_deal_id: user_deal.id)
  end
end