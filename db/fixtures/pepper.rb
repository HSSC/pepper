# default PEPPER survey
Survey.seed do |s|
    s.id = 1
    s.study_identifier = 'PEPPER'
    s.total_n = 100
    s.default_set_title = 'Which Anticoagulation Option Do Your Prefer?'
    s.default_set_subtitle = nil
    s.default_legend_image = File.open(Rails.root.join("app/assets/images/people/person.png"))
    s.default_legend_description = 'Nothing happens'
end

# we have 10 scenarios or question_sets

10.times do |num|
  QuestionSet.seed do |qs|
    qs.id = num+1
    qs.survey_id = 1
    qs.participant_identifier = 'PAT0'
  end
end

# after this it runs question_set_1...10
