require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # has_secure_passwordを使わずにbcrypt経由のpassword用setterとgetterを直接定義する際に必要
  include BCrypt

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_many :blogs, class_name: 'Blog', dependent: :destroy

  def password
    return nil if password_digest.nil?
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(raw_password)
    if raw_password.blank?
      self.password_digest = nil
    else
      @password = BCrypt::Password.create(raw_password)
      self.password_digest = @password
    end
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(raw_password)
    return false if raw_password.blank?
    BCrypt::Password.new(password_digest).is_password?(raw_password)
  end
end
