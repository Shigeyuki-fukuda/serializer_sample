require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
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
