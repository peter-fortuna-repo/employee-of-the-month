class Post < ApplicationRecord
  validates :name, presence: true
  validates :month_year, presence: true
  validates :description, length: { maximum: 500 }

  # def self.recent_posts(limit = 10)
  #   order(created_at: :desc).limit(limit)
  # end

  def formatted_date
    month_year.strftime("%B %Y")
  end
end