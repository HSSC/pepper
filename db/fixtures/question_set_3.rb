### Begin QuestionSet id:3 ###

  ### Begin Question id:4 ###
  Question.seed do |q|
    q.id = 5
    q.question_set_id = 3
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "5 patients out of 100 will experience this bleeding event and zero patients out of 100 will be hospitalized for 1-2 days due to a clot in leg"
  end

    ### Begin QuestionDimension id:4 ###
    QuestionDimension.seed do |qd|
      qd.id = 7
      qd.question_id = 5
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Slow wound healing, bruising, pain or stiffness caused by bleeding"
      qd.help_text = ""
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:4 ###

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 8
      qd.question_id = 5
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Signs of deep vein thrombosis (DVT) that leads to hospital stay"
      qd.help_text = ""
      qd.help_text_description = "Risk of a clot in the leg that requires spending 1-2 days in the hospital. Results in a slow recovery of physical health"
    end
    ### End QuestionDimension id:5 ###

  ### End Question id:4 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 6
    q.question_set_id = 3
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "Zero patients out of 100 will experience a this bleeding event and 5 patients out of 100 will be hospitalized for 1-2 days due to a clot in leg"
  end

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 9
      qd.question_id = 6
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Slow wound healing, bruising, pain or stiffness caused by bleeding"
      qd.help_text = ""
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:6 ###

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 10
      qd.question_id = 6
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Signs of deep vein thrombosis (DVT) that leads to hospital stay"
      qd.help_text = ""
      qd.help_text_description = "Risk of a clot in the leg that requires spending 1-2 days in the hospital. Results in a slow recovery of physical health"
    end
    ### End QuestionDimension id:7 ###

  ### End Question id:5 ###

### End QuestionSet id:3 ###

### Generate images for questions 4&5###
Question.where(id: [5,6]).each(&:save)
