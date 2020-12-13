class Api::V1::BlogsController < ApplicationController
  def index
    blogs = current_user.blogs.order(created_at: :desc)
    render json: BlogSerializer.new(blogs).serializable_hash
  end

  def create
    blog = current_user.blogs.new(blog_params)
    if blog.save
      head :ok
    else
      head :bad_request
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
