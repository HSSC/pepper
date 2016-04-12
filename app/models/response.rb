class Response < ActiveRecord::Base
  belongs_to :question_set
  belongs_to :question
  belongs_to :response_set
end
