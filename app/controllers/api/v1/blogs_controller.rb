class Api::V1::BlogsController < ApplicationController
  def index
    @blogs = Blog.order(created_at: :desc)
    render json: {
      blogs: @blogs.map do |blog|
        {
          id: blog.id,
          title: blog.title,
          content: blog.content
        }
      end
    }
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      head :success
    else
      head :bad_request
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
