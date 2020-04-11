class Chore < ApplicationRecord
  belongs_to :user
  default_scope -> { order(difficultyLvl: :asc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 25 }
  validates :description, length: { maximum: 255 }
  validates :price, presence: true
  validates :difficultyLvl, presence: true, length: { maximum: 1 }
  validates :completeBy, presence: true
end
