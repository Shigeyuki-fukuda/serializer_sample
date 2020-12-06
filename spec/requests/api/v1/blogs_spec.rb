require 'rails_helper'

RSpec.describe "Api::V1::Blogs", type: :request do
  describe "GET /api/v1/blogs" do
    let(:path) { "/api/v1/blogs" }
    let(:json) { JSON.parse(response.body) }
    before { create_list(:blog, 10) }

    it "Blog一覧が表示されること" do
      get path
      expect(response).to have_http_status :ok
      expect(json.count).to eq 10
    end
  end

  describe "POST /api/v1/blogs" do
    let(:path) { "/api/v1/blogs" }
    let(:title) { Faker::Games::Pokemon.name }
    let(:params) {
      {
        blog: {
          title: title,
          content: "#{title}の話をしました！"
        }
      }
    }

    it "Blogが作られること" do
      post path, params: params
      expect(response).to have_http_status :ok
      expect(Blog.count).to eq 1
    end
  end
end
