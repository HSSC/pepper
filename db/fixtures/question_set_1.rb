### Begin QuestionSet id:1 ###

  ### Begin Question id:1 ###
  Question.seed do |q|
    q.id = 1
    q.question_set_id = 1
    q.panel_title = 'Treatment A'
    q.panel_description = "Zero patients out of 100 will experience a minor bleeding event and will pay a $200 copay"
  end

    ### Begin QuestionDimension id:1 ###
    QuestionDimension.seed do |qd|
      qd.id = 1
      qd.question_id = 1
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/O_person.png"))
      qd.legend_description = "Minor bleeding causing slow wound healing, bruising, pain or stiffness"
      qd.help_text_image = "03_MinorBleedingAnimation.mp4"
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:1 ###

    ### Begin QuestionAttribute id:1 ###
    QuestionAttribute.seed do |qa|
      qa.id = 1
      qa.question_id = 1
      qa.description = "$200 copay"
      qa.panel_title = ""
      qa.panel_description = ""
    end
    ### End Question Attribute id:1 ###

  ### End Question id:1 ###

  ### Begin Question id:2 ###
  Question.seed do |q|
    q.id = 2
    q.question_set_id = 1
    q.panel_title = 'Treatment B'
    q.panel_description = "2 patients out of 100 will experience a minor bleeding event and will not pay a copay"
  end

    ### Begin QuestionDimension id:2 ###
    QuestionDimension.seed do |qd|
      qd.id = 2
      qd.question_id = 2
      qd.count = 2
      qd.image = File.open(Rails.root.join("app/assets/images/people/O_person.png"))
      qd.legend_description = "Minor bleeding causing slow wound healing, bruising, pain or stiffness"
      qd.help_text_image = "03_MinorBleedingAnimation.mp4"
      qd.help_text_description = "Risk of bleeding that can cause pain, stiffness, and wound leakage.  Requires a visit to surgeon’s office to drain blood"
    end
    ### End QuestionDimension id:2 ###

    ### Begin QuestionAttribute id:2 ###
    QuestionAttribute.seed do |qa|
      qa.id = 2
      qa.question_id = 2
      qa.description = "No Copay"
      qa.panel_title = ""
      qa.panel_description = ""
    end
    ### End Question Attribute id:2 ###

  ### End Question id:2 ###

### End QuestionSet id:1 ###

### Generate images for questions 1&2###
Question.where(id: [1,2]).each(&:save)
