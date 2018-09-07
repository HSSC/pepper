### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 15
    q.question_set_id = 8
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "1 patient out of 100 will experience a life threatening clot in the lung"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 23
      qd.question_id = 15
      qd.count = 1
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Life threatening clot in the lung Risk of life threatening clot in the lung"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:5 ###

    QuestionAttribute.seed do |qa|
      qa.id = 9
      qa.question_id = 15
      qa.description = "Blood test requiring a visit to the provider twice a week for 4 weeks"
      qa.panel_title = "A blood test is required"
      qa.panel_description = "A blood test is required"
    end

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 16
    q.question_set_id = 8
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "Zero patients out of 100 will experience a life threatening clot in the lung"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 24
      qd.question_id = 16
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Life threatening clot in the lung Risk of life threatening clot in the lung"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:7 ###

    QuestionAttribute.seed do |qa|
      qa.id = 10
      qa.question_id = 16
      qa.description = "Blood test requiring a visit to the provider twice a week for 4 weeks"
      qa.panel_title = "No blood test is required"
      qa.panel_description = "No blood test is required"
    end

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [15,16]).each(&:save)
