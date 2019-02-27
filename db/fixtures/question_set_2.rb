### Begin QuestionSet id:2 ###

  ### Begin Question id:3 ###
  Question.seed do |q|
    q.id = 3
    q.question_set_id = 2
    q.panel_title = 'Treatment A'
    q.panel_description = "5 patients out of 100 will experience a major bleeding event and zero patients out of 100 will experience a clot in the lung (can be life threatening)"
  end

    ### Begin QuestionDimension id:3 ###
    QuestionDimension.seed do |qd|
      qd.id = 3
      qd.question_id = 3
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/P_person.png"))
      qd.legend_description = "Major bleeding causing infection of the leg and removal of the implant"
      qd.help_text_image = "04_Major_Bleading.mp4"
      qd.help_text_description = "Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
    end
    ### End QuestionDimension id:3 ###

    ### Begin QuestionDimension id:4 ###
    QuestionDimension.seed do |qd|
      qd.id = 4
      qd.question_id = 3
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/B_person.png"))
      qd.legend_description = "Pulmonary Embolism, clot in the lung"
      qd.help_text_image = "01_Shortness_of_Breath_Animated.mp4"
      qd.help_text_description = "Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital"
    end
    ### End QuestionDimension id:4 ###

  ### End Question id:3 ###

  ### Begin Question id:4 ###
  Question.seed do |q|
    q.id = 4
    q.question_set_id = 2
    q.panel_title = 'Treatment B'
    q.panel_description = "Zero patients out of 100 will experience a major bleeding event and 2 patients out of 100 will experience a clot in the lung (can be life threatening)"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 5
      qd.question_id = 4
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/P_person.png"))
      qd.legend_description = "Major bleeding causing infection of the leg and removal of the implant"
      qd.help_text_image = "04_Major_Bleading.mp4"
      qd.help_text_description = "Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
    end
    ### End QuestionDimension id:5 ###

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 6
      qd.question_id = 4
      qd.count = 2
      qd.image = File.open(Rails.root.join("app/assets/images/people/B_person.png"))
      qd.legend_description = "Pulmonary Embolism, clot in the lung"
      qd.help_text_image = "01_Shortness_of_Breath_Animated.mp4"
      qd.help_text_description = "Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital"
    end
    ### End QuestionDimension id:6 ###

  ### End Question id:4 ###

### End QuestionSet id:2 ###

### Generate images for questions 3&4###
Question.where(id: [3,4]).each(&:save)
