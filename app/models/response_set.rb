class ResponseSet < ActiveRecord::Base
  include Tokenable

  belongs_to :survey
  has_many :responses

  validates :survey_id, presence: true
  validates :user_token, presence: true, uniqueness: true
end
