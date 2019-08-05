class User < ApplicationRecord
  validates_presence_of [:first_name, :last_name]
  has_many :plans, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :trades, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
