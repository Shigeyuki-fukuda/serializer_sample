require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # has_secure_passwordを使わずにbcrypt経由のpassword用setterとgetterを直接定義する際に必要
  include BCrypt

  field :name, type: String
  field :email, type: String
  field :password_hash, type: String

  has_many :blogs, class_name: 'Blog', dependent: :destroy

  def password
    return nil if password_hash.nil?
    Password.new(password_hash)
  end

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end
end
