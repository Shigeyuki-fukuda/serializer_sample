class BlogSerializer < ActiveModel::Serializer
  attribute :blog do
    {
      id: object.id.to_s,
      title: object.title,
      content: object.content
    }
  end
end
