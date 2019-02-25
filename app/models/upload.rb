class Upload < ApplicationRecord
  has_many_attached :files
  belongs_to :user

  before_destroy :remove_attachments
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  before_validation :sanitize_list

  private

  def sanitize_list; end
end
