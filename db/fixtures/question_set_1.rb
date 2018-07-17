### Begin QuestionSet id:1 ###

  ### Begin Question id:1 ###
  Question.seed do |q|
    q.id = 1
    q.question_set_id = 1
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "1 patient out of 100 will experience this bleeding event"
  end

    ### Begin QuestionDimension id:1 ###
    QuestionDimension.seed do |qd|
      qd.id = 1
      qd.question_id = 1
      qd.count = 1
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Bruising and wound leakage due to bleeding "
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:1 ###

    ### Begin QuestionAttribute id:1 ###
    QuestionAttribute.seed do |qa|
      qa.id = 1
      qa.question_id = 1
      qa.description = "No copay"
      qa.panel_title = "Option 1 Copay"
      qa.panel_description = "This option does not require a copay"
    end
    ### End Question Attribute id:1 ###

  ### End Question id:1 ###

  ### Begin Question id:2 ###
  Question.seed do |q|
    q.id = 2
    q.question_set_id = 1
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "3 patients out of 100 will experience this bleeding event"
  end

    ### Begin QuestionDimension id:2 ###
    QuestionDimension.seed do |qd|
      qd.id = 2
      qd.question_id = 2
      qd.count = 3
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Bruising and wound leakage due to bleeding"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:2 ###

    ### Begin QuestionAttribute id:2 ###
    QuestionAttribute.seed do |qa|
      qa.id = 2
      qa.question_id = 2
      qa.description = "$50-$200 copay"
      qa.panel_title = "Option 2 Copay"
      qa.panel_description = "This option requires between a $50 and $200 copay"
    end
    ### End Question Attribute id:2 ###

  ### End Question id:2 ###

### End QuestionSet id:1 ###

### Generate images for questions 1&2###
Question.where(id: [1,2]).each(&:save)
