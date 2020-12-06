class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :password_hash, type: String

  has_many :blogs, class_name: 'Blog', dependent: :destroy
end
