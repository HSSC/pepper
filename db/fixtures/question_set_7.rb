### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 13
    q.question_set_id = 7
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "A blood test is required"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 21
      qd.question_id = 13
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Blood test requiring a visit to the provider twice a week for 4 weeks"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:5 ###

    QuestionAttribute.seed do |qa|
      qa.id = 5
      qa.question_id = 13
      qa.description = "A copay that ranges from $50- $200"
      qa.panel_title = "Option 1 Copay"
      qa.panel_description = "No copay"
    end

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 14
    q.question_set_id = 7
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "No blood test is required"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 22
      qd.question_id = 14
      qd.count = 2
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Blood test requiring a visit to the provider twice a week for 4 weeks"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:7 ###

    QuestionAttribute.seed do |qa|
      qa.id = 6
      qa.question_id = 14
      qa.description = "A copay that ranges from $50- $200"
      qa.panel_title = "Option 1 Copay"
      qa.panel_description = "$50-$200"
    end

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [13,14]).each(&:save)
