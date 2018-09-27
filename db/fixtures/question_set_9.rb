### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 17
    q.question_set_id = 9
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "Zero patients out of 100 will be hospitalized for 1-2 days due to a clot in leg"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 27
      qd.question_id = 17
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Signs of deep vein thrombosis (DVT) that leads to hospital stay: Risk of a clot in the leg that requires spending 1-2 days in the hospital. Results in a slow recovery of physical health"
      qd.help_text = ""
      qd.help_text_description = ""
    end
    ### End QuestionDimension id:5 ###

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 28
      qd.question_id = 17
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Implant removal due to an infection, caused by major bleeding  : Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
      qd.help_text = ""
      qd.help_text_description = ""
    end
    ### End QuestionDimension id:6 ###

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 18
    q.question_set_id = 9
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "10 patients out of 100 will be hospitalized for 1-2 days due to a clot in leg"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 29
      qd.question_id = 18
      qd.count = 10
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Signs of deep vein thrombosis (DVT) that leads to hospital stay: Risk of a clot in the leg that requires spending 1-2 days in the hospital. Results in a slow recovery of physical health"
      qd.help_text = ""
      qd.help_text_description = ""
    end
    ### End QuestionDimension id:7 ###

    ### Begin QuestionDimension id:8 ###
    QuestionDimension.seed do |qd|
      qd.id = 30
      qd.question_id = 18
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Implant removal due to an infection, caused by major bleeding  : Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
      qd.help_text = ""
      qd.help_text_description = ""
    end
    ### End QuestionDimension id:8 ###

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [17,18]).each(&:save)
