class User < ApplicationRecord
  belongs_to :role
  has_many :ratings
  has_many :requested_books
  has_many :books, through: :requested_books
  has_many :issue_books
  has_many :books, through: :issue_books
  validates :email, :name, :gender, :address, :mobile, :role_id, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end