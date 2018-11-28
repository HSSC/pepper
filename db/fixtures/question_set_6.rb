### Begin QuestionSet id:6 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 11
    q.question_set_id = 6
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "Zero patients out of 100 will be hospitalized for 1-2 days due to a clot in leg and a blood test is required. Blood test requiring a visit to the provider twice a week for 4 weeks"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 17
      qd.question_id = 11
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Signs of deep vein thrombosis (DVT) that leads to hospital stay"
      qd.help_text = ""
      qd.help_text_description = "Risk of a clot in the leg that requires spending 1-2 days in the hospital. Results in a slow recovery of physical health"
    end
    ### End QuestionDimension id:5 ###

    QuestionAttribute.seed do |qa|
      qa.id = 5
      qa.question_id = 11
      qa.description = "A blood test is required"
      qa.panel_title = "Option 1 blood test"
      qa.panel_description = "Blood test requiring a visit to the provider twice a week for 4 weeks"
    end

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 12
    q.question_set_id = 6
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "5 patients out of 100 will be hospitalized for 1-2 days due to a clot in leg and no blood test is required"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 18
      qd.question_id = 12
      qd.count = 5
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Signs of deep vein thrombosis (DVT) that leads to hospital stay"
      qd.help_text = ""
      qd.help_text_description = "Risk of a clot in the leg that requires spending 1-2 days in the hospital. Results in a slow recovery of physical health"
    end
    ### End QuestionDimension id:7 ###

    QuestionAttribute.seed do |qa|
      qa.id = 6
      qa.question_id = 12
      qa.description = "No blood test is required"
      qa.panel_title = "Option 2 blood test"
      qa.panel_description = "Blood test requiring a visit to the provider twice a week for 4 weeks"
    end

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [11,12]).each(&:save)