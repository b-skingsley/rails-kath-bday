class Post < ApplicationRecord
  acts_as_paranoid

  has_one_attached :photo
  after_commit :save_dimensions_now

  validates :author, presence: true
  validates :photo, presence: true

  def height
    photo.metadata['height']
  end

  def width
    photo.metadata['width']
  end

  private

  def save_dimensions_now
    # photo.analyze if photo.attached?
  end
end
