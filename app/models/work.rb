class Work < ApplicationRecord
  belongs_to :project

  validates_presence_of :start
  validates_associated :project
end
