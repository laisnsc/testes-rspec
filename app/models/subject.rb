class Subject < ApplicationRecord
  has_many :questions
  validates :description, presence: true
end
