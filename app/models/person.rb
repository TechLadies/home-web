class Person < ActiveRecord::Base
  validates :name, :gender, presence: true
  validates :email, format: { with: /@/ , message: "Please check email"}
  validates :phone, numericality: { only_integer: true }
end
