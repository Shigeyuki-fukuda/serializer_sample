require 'rails_helper'

RSpec.describe "Api::V1::Blogs", type: :request do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: user.id })
  end

  describe "GET /api/v1/blogs" do
    let(:path) { "/api/v1/blogs" }
    let(:json) { JSON.parse(response.body) }

    before { create_list(:blog, 10, user: user) }

    it "Blog一覧が表示されること" do
      get path
      expect(response).to have_http_status :ok
      expect(json.dig('data').count).to eq 10
    end
  end

  describe "POST /api/v1/blogs" do
    let(:path) { "/api/v1/blogs" }
    let(:title) { Faker::Games::Pokemon.name }
    let(:params) do
      {
        blog: {
          title: title,
          content: "#{title}の話をしました！"
        }
      }
    end

    it "Blogが作られること" do
      expect {
        post path, params: params
      }.to change(Blog, :count).from(0).to(1)
    end
  end
end
