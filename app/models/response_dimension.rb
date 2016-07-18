class ResponseDimension < ActiveRecord::Base
  belongs_to :response

  has_attached_file :image
  do_not_validate_attachment_file_type :image

  validates :count, presence: true
  validates :response, presence: true
  validates :image, presence: true

end
