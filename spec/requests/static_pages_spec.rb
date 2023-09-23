require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:base_title) { '| mytodo' }

  describe "homeページ" do
    it "アクセスに成功すること" do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Home #{base_title}"
      
    end
  end

  describe "aboutページ" do
    it "アクセスに成功すること" do
      get "/static_pages/about"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "About #{base_title}"
    end
  end

  describe "helpアクション" do
    it "アクセスに成功すること" do
      get "/static_pages/help"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Help #{base_title}"
    end
  end

end
