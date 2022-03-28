class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders

  def active_for_authentication?
    super && (self.is_active == true)
  end
end

class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :encrypted_password) #追加したいパラメータ
  end
end