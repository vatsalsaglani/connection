class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :posts
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "10x10#" }, default_url: "/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x200#" }, default_url: "/images/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
