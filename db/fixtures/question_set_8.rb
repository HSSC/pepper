### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 15
    q.question_set_id = 8
    q.panel_title = 'Treatment A'
    q.panel_description = "1 patient out of 100 will experience a clot in the lung (can be life threatening) and no blood test is required"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 23
      qd.question_id = 15
      qd.count = 1
      qd.image = File.open(Rails.root.join("app/assets/images/people/B_person.png"))
      qd.legend_description = "Pulmonary Embolism, clot in the lung"
      qd.help_text_image = "01_Shortness of Breath_Animated.mp4"
      qd.help_text_description = "Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital"
    end
    ### End QuestionDimension id:5 ###

    QuestionAttribute.seed do |qa|
      qa.id = 12
      qa.question_id = 15
      qa.description = "No blood test is required"
      qa.panel_title = ""
      qa.panel_description = ""
    end

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 16
    q.question_set_id = 8
    q.panel_title = 'Treatment B'
    q.panel_description = "Zero patients out of 100 will experience a clot in the lung (can be life threatening) and a blood test is required. Blood test requiring a visit to the provider twice a week for 4 weeks"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 24
      qd.question_id = 16
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/B_person.png"))
      qd.legend_description = "Pulmonary Embolism, clot in the lung"
      qd.help_text_image = "01_Shortness of Breath_Animated.mp4"
      qd.help_text_description = "Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital"
    end
    ### End QuestionDimension id:7 ###

    QuestionAttribute.seed do |qa|
      qa.id = 13
      qa.question_id = 16
      qa.description = "A blood test is required"
      qa.panel_title = ""
      qa.panel_description = ""
    end

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [15,16]).each(&:save)
