### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 11
    q.question_set_id = 6
    q.panel_title = 'Treatment A'
    q.panel_description = "Zero patients out of 100 will experience a clot in the leg (requires 1-2 days in the hospital) and a blood test is required"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 17
      qd.question_id = 11
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Deep vein thrombosis (DVT), clot in the leg"
      qd.help_text_image = "02_DVT_ANIMATED.mp4"
      qd.help_text_description = "Risk of a clot in the leg, it can cause leg pain or swelling, but also can occur with no symptoms. DVT may require spending 1-2 days in the hospital"
    end
    ### End QuestionDimension id:5 ###

    QuestionAttribute.seed do |qa|
      qa.id = 5
      qa.question_id = 11
      qa.description = "A blood test is required"
      qa.panel_title = ""
      qa.panel_description = ""
    end

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 12
    q.question_set_id = 6
    q.panel_title = 'Treatment B'
    q.panel_description = "5 patients out of 100 will experience a clot in the leg (requires 1-2 days in the hospital) and no blood test is required"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 18
      qd.question_id = 12
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Deep vein thrombosis (DVT), clot in the leg"
      qd.help_text_image = "02_DVT_ANIMATED.mp4"
      qd.help_text_description = "Risk of a clot in the leg, it can cause leg pain or swelling, but also can occur with no symptoms. DVT may require spending 1-2 days in the hospital"
    end
    ### End QuestionDimension id:7 ###

    QuestionAttribute.seed do |qa|
      qa.id = 6
      qa.question_id = 12
      qa.description = "No blood test is required"
      qa.panel_title = ""
      qa.panel_description = ""
    end

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [11,12]).each(&:save)
