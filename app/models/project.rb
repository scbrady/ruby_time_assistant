class Project < ApplicationRecord
  belongs_to :client
  has_many :works, dependent: :destroy
  enum status: [ :in_progress, :finished, :billed, :paid ]

  validates_presence_of :name
  validates_associated :client
end
