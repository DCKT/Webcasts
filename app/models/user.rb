class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar
  has_many :favoris
  has_many :commentaires

  after_create :send_welcome_mail

  def send_welcome_mail
    Contact.welcome(self.email).deliver
  end
end
