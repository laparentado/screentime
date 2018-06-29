class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :watcheds
  has_many :watched_shows
  has_many :favorites
  has_many :want_movies
  has_many :want_shows
end
