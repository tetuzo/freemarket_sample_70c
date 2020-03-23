require 'rails_helper'

describe ItemsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'create item' do
    let(:item) { FactoryBot.build(:item) }
    it "itemが正常に作成できているかどうか" do
      expect(item).to be_valid
    end
  end  

end

