### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 17
    q.question_set_id = 9
    q.panel_title = 'Treatment A'
    q.panel_description = "Zero patients out of 100 will experience a clot in the leg (requires 1-2 days in the hospital) and 5 patients out of 100 will experience major bleeding event"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 27
      qd.question_id = 17
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Deep vein thrombosis (DVT), clot in the leg"
      qd.help_text_image = "02_DVT_ANIMATED.mp4"
      qd.help_text_description = "Risk of a clot in the leg, it can cause leg pain or swelling, but also can occur with no symptoms. DVT may require spending 1-2 days in the hospital"
    end
    ### End QuestionDimension id:5 ###

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 28
      qd.question_id = 17
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/P_person.png"))
      qd.legend_description = "Major bleeding causing infection of the leg and removal of the implant"
      qd.help_text_image = "04_Major Bleading.mp"
      qd.help_text_description = "Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
    end
    ### End QuestionDimension id:6 ###

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 18
    q.question_set_id = 9
    q.panel_title = 'Treatment B'
    q.panel_description = "10 patients out of 100 will experience a clot in the leg (requires 1-2 days in the hospital) and zero patients out of 100 will experience major bleeding event"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 29
      qd.question_id = 18
      qd.count = 10
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Deep vein thrombosis (DVT), clot in the leg"
      qd.help_text_image = "02_DVT_ANIMATED.mp4"
      qd.help_text_description = "Risk of a clot in the leg, it can cause leg pain or swelling, but also can occur with no symptoms. DVT may require spending 1-2 days in the hospital"
    end
    ### End QuestionDimension id:7 ###

    ### Begin QuestionDimension id:8 ###
    QuestionDimension.seed do |qd|
      qd.id = 30
      qd.question_id = 18
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/P_person.png"))
      qd.legend_description = "Major bleeding causing infection of the leg and removal of the implant"
      qd.help_text_image = "04_Major Bleading.mp"
      qd.help_text_description = "Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
    end
    ### End QuestionDimension id:8 ###

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [17,18]).each(&:save)
