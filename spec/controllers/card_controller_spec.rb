require 'rails_helper'
require 'spec_helper'

describe CardController do

  let(:card) { create(:card) }
  let(:user) { create(:user) }

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
        get :new, params: { user_id: user.id }
      end
      
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      it "renders the :new template" do
      end
    end
  end

end