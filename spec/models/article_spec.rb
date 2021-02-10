require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#create' do
    before do
      @article = FactoryBot.build(:article)  
    end

    context '投稿できる' do
    
    end

    context '投稿できない' do
      
    end

  end
end
