class Anime < ApplicationRecord
  belongs_to :user

  enum :status, { 視聴予定: 0, 視聴中: 1, 視聴済み: 2 }

  validates :title, presence: true
end

