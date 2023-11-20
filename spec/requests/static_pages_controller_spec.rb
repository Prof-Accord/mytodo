require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'get #home' do
    it 'アクセスに成功すること' do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'Mytodo'
    end
  end

  describe 'get #about' do
    it 'アクセスに成功すること' do
      get '/static_pages/about'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'About | Mytodo'
    end
  end

  describe 'get #help' do
    it 'アクセスに成功すること' do
      get '/static_pages/help'
      expect(response).to have_http_status(:success)
      expect(response.body).to include 'Help | Mytodo'
    end
  end
end
