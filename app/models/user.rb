class User < ApplicationRecord
    validates :name, presence: true
    validates :company, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true
  end