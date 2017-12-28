class Project < ApplicationRecord
  after_initialize :init
  belongs_to :client
  has_many :works, dependent: :destroy
  enum status: [ :in_progress, :finished, :billed, :paid ]

  def init
    self.status  ||= :in_progress
  end

  validates_presence_of :name
  validates_associated :client
end
