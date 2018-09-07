### Begin QuestionSet id:5 ###

  ### Begin Question id:1 ###
  Question.seed do |q|
    q.id = 9
    q.question_set_id = 5
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "2 patients out of 100 will experience this bleeding event"
  end

    ### Begin QuestionDimension id:1 ###
    QuestionDimension.seed do |qd|
      qd.id = 15
      qd.question_id = 9
      qd.count = 2
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Implant removal due to an infection, caused by major bleeding  : Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:1 ###

    ### Begin QuestionAttribute id:1 ###
    QuestionAttribute.seed do |qa|
      qa.id = 3
      qa.question_id = 9
      qa.description = "No copay"
      qa.panel_title = "Option 1 Copay"
      qa.panel_description = "No copay"
    end
    ### End Question Attribute id:1 ###

  ### End Question id:1 ###

  ### Begin Question id:2 ###
  Question.seed do |q|
    q.id = 10
    q.question_set_id = 5
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "zero patients out of 100 will experience this bleeding event"
  end

    ### Begin QuestionDimension id:2 ###
    QuestionDimension.seed do |qd|
      qd.id = 16
      qd.question_id = 10
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Implant removal due to an infection, caused by major bleeding  : Undergoing another operation to replace an infected joint due to major bleeding (inpatient stay needed)"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:2 ###

    ### Begin QuestionAttribute id:2 ###
    QuestionAttribute.seed do |qa|
      qa.id = 4
      qa.question_id = 10
      qa.description = "$50-$200 copay"
      qa.panel_title = "Option 2 Copay"
      qa.panel_description = "$50-$200"
    end
    ### End Question Attribute id:2 ###

  ### End Question id:2 ###

### End QuestionSet id:1 ###

### Generate images for questions 1&2###
Question.where(id: [9,10]).each(&:save)
