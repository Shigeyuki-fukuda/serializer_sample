require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /login" do
    let(:path) { "/login" }

    before { create(:user, email: email, password: password) }

    context "メールアドレスが正しくない場合" do
      let(:email) { Faker::Internet.email }
      let(:password) { "password" }
      let(:params) { { email: "www@example.com", password: password } }

      it "ログイン失敗し、ステータスコード401が返る" do
        post path, params: params
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "パスワードが正しくない場合" do
      let(:email) { Faker::Internet.email }
      let(:password) { "password" }
      let(:params) { { email: email, password: "wwwwww" } }

      it "ログイン失敗し、ステータスコード401が返る" do
        post path, params: params
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "メールアドレス / パスワードが正しい場合" do
      let(:email) { Faker::Internet.email }
      let(:password) { "password" }
      let(:params) { { email: email, password: password } }

      it "ログイン成功し、ステータスコード200が返る" do
        post path, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
