class Client < ApplicationRecord
  belongs_to :user, optional: true
  has_many :projects, dependent: :destroy

  validates_presence_of :name
  # validates_associated :user
end
