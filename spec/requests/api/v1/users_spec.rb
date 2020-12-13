require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/users/:id" do
    let(:path) { "/api/v1/users/#{user.id}" }
    let(:json) { JSON.parse(response.body) }
    let(:user) { create(:user) }

    before do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: user.id })
    end

    it "Userの登録情報がJSONで返ること" do
      get path
      expect(json.dig('data', 'attributes', 'user', 'name')).to eq user.name
      expect(json.dig('data', 'attributes', 'user', 'email')).to eq user.email
    end
  end

  describe "POST /api/v1/users" do
    let(:path) { "/api/v1/users" }
    let(:params) do
      {
        user: {
          name: Faker::Games::Pokemon.name,
          email: Faker::Internet.email,
          password: "password"
        }
      }
    end

    it "Userが作られること" do
      expect {
        post path, params: params
      }.to change(User, :count).from(0).to(1)
    end
  end
end
