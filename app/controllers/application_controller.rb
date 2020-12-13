class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
    devise_parameter_sanitizer.permit(:accunt_update, keys: [:email, :last_name, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
  end

  def after_sign_out_path_for(resource)
    # byebug
    case resource
    when :admin
      new_admin_session_path
    when :customer
      new_customer_session_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      root_path
    end
  end
end

    # t.string "last_name"
    # t.string "first_name"
    # t.string "last_name_kana"
    # t.string "first_name_kana"
    # t.string "postal_code"
    # t.string "address"
    # t.string "telephone_number"
    # t.boolean "is_deleted"

    # :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted