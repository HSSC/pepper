### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 13
    q.question_set_id = 7
    q.panel_title = 'Treatment A'
    q.panel_description = "A blood test is required and no copay. Blood test requiring a visit to the provider twice a week for 4 weeks"
  end

    ### Begin QuestionDimension id:5 ###

    QuestionAttribute.seed do |qa|
      qa.id = 8
      qa.question_id = 13
      qa.description = "A blood test is required"
      qa.panel_title = ""
      qa.panel_description = ""
    end

    QuestionAttribute.seed do |qa|
      qa.id = 9
      qa.question_id = 13
      qa.description = "No copay"
      qa.panel_title = ""
      qa.panel_description = ""
    end

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 14
    q.question_set_id = 7
    q.panel_title = 'Treatment B'
    q.panel_description = "No blood test is required and a $200 copay"
  end

    ### Begin QuestionDimension id:7 ###

    QuestionAttribute.seed do |qa|
      qa.id = 10
      qa.question_id = 14
      qa.description = "No blood test is required"
      qa.panel_title = ""
      qa.panel_description = ""
    end

    QuestionAttribute.seed do |qa|
      qa.id = 11
      qa.question_id = 14
      qa.description = "$200 copay"
      qa.panel_title = ""
      qa.panel_description = ""
    end

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [13,14]).each(&:save)
