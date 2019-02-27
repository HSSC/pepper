### Begin QuestionSet id:4 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 7
    q.question_set_id = 4
    q.panel_title = 'Treatment A'
    q.panel_description = "Zero patients out of 100 will experience this bleeding event and 1 patient out of 100 will experience a clot in the lung (can be life threatening)"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 11
      qd.question_id = 7
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/O_person.png"))
      qd.legend_description = "Minor bleeding causing slow wound healing, bruising, pain or stiffness"
      qd.help_text_image = "03_MinorBleedingAnimation.mp4"
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:5 ###

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 12
      qd.question_id = 7
      qd.count = 1
      qd.image = File.open(Rails.root.join("app/assets/images/people/B_person.png"))
      qd.legend_description = "Pulmonary Embolism, clot in the lung"
      qd.help_text_image = "01_Shortness_of_Breath_Animated.mp4"
      qd.help_text_description = "Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital"
    end
    ### End QuestionDimension id:6 ###

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 8
    q.question_set_id = 4
    q.panel_title = 'Treatment B'
    q.panel_description = "10 patients out of 100 will experience this bleeding event and zero patients out of 100 will experience a clot in the lung (can be life threatening)"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 13
      qd.question_id = 8
      qd.count = 10
      qd.image = File.open(Rails.root.join("app/assets/images/people/O_person.png"))
      qd.legend_description = "Minor bleeding causing slow wound healing, bruising, pain or stiffness"
      qd.help_text_image = "03_MinorBleedingAnimation.mp4"
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:7 ###

    ### Begin QuestionDimension id:8 ###
    QuestionDimension.seed do |qd|
      qd.id = 14
      qd.question_id = 8
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/B_person.png"))
      qd.legend_description = "Pulmonary Embolism, clot in the lung"
      qd.help_text_image = "01_Shortness_of_Breath_Animated.mp4"
      qd.help_text_description = "Risk of clot in the lung (can be life threatening) that requires spending 5-7 days in the hospital"
    end
    ### End QuestionDimension id:8 ###

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [7,8]).each(&:save)
