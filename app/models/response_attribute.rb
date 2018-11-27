class ResponseAttribute < ActiveRecord::Base
  belongs_to :response

  has_attached_file :image
  do_not_validate_attachment_file_type :image
end
