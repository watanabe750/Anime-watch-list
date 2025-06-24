class Anime < ApplicationRecord
  belongs_to :user

  enum :status, { plan_to_watch: 0, watching: 1, watched: 2 }

  validates :title, presence: true
end

