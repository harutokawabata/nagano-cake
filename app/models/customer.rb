class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :last_name, presence: true
  # validates :first_name, presence: true
  # validates :last_name_kana, presence: true
  # validates :first_name_kana, presence: true
  # validates :email, presence: true
  # validates :postal_code, presence: true
  # validates :address, presence: true
  # validates :telephone_number, presence: true

  has_many :cart_items
  has_many :addresses
  has_many :orders
  # has_many :order
  

end

  # :last_name, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted
