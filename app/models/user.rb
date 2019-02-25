class User < ApplicationRecord
  has_secure_password

  has_many :uploads

  validates_presence_of :name, :password_digest
  validates :email, presence: true, uniqueness:true
end
