class Subject < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :description, presence: true, length: { maximum: 140 }
end
