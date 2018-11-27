### Begin QuestionSet id:4 ###

  ### Begin Question id:5 ###
  Question.seed do |q|
    q.id = 7
    q.question_set_id = 4
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "Zero patients out of 100 will experience this bleeding event and 1 patient out of 100 will experience a life threatening clot in the lung"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 11
      qd.question_id = 7
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Slow wound healing, bruising, pain or stiffness caused by bleeding"
      qd.help_text = ""
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:5 ###

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 12
      qd.question_id = 7
      qd.count = 1
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Life threatening clot in the lung"
      qd.help_text = ""
      qd.help_text_description = "Risk of life threatening clot in the lung"
    end
    ### End QuestionDimension id:6 ###

  ### End Question id:5 ###

  ### Begin Question id:6 ###
  Question.seed do |q|
    q.id = 8
    q.question_set_id = 4
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "10 patients out of 100 will experience this bleeding event and zero patients out of 100 will experience a life threatening clot in the lung"
  end

    ### Begin QuestionDimension id:7 ###
    QuestionDimension.seed do |qd|
      qd.id = 13
      qd.question_id = 8
      qd.count = 10
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Slow wound healing, bruising, pain or stiffness caused by bleeding"
      qd.help_text = ""
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:7 ###

    ### Begin QuestionDimension id:8 ###
    QuestionDimension.seed do |qd|
      qd.id = 14
      qd.question_id = 8
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Life threatening clot in the lung"
      qd.help_text = ""
      qd.help_text_description = "Risk of life threatening clot in the lung"
    end
    ### End QuestionDimension id:8 ###

  ### End Question id:6 ###

### End QuestionSet id:4 ###

### Generate images for questions 5&6###
Question.where(id: [7,8]).each(&:save)
