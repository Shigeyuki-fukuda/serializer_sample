class BlogSerializer
  include Alba::Resource

  attributes :title, :content
  attribute :id do |blog|
    blog.id.to_s
  end
end
