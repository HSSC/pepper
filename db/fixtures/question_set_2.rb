### Begin QuestionSet id:2 ###

  ### Begin Question id:3 ###
  Question.seed do |q|
    q.id = 3
    q.question_set_id = 2
    q.panel_title = 'Option 1 Profile'
    q.panel_description = "Zero patients out of 100 will be hospitalized for 1-5 days due to a clot in lung or leg, 1 patient out of 100 will experience a life threatening clot in the lung"
  end

    ### Begin QuestionDimension id:3 ###
    QuestionDimension.seed do |qd|
      qd.id = 3
      qd.question_id = 3
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Symptomatic clot in the leg"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:3 ###

    ### Begin QuestionDimension id:4 ###
    QuestionDimension.seed do |qd|
      qd.id = 4
      qd.question_id = 3
      qd.count = 1
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Life threatening clot in the lung"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:4 ###

  ### End Question id:3 ###

  ### Begin Question id:4 ###
  Question.seed do |q|
    q.id = 4
    q.question_set_id = 2
    q.panel_title = 'Option 2 Profile'
    q.panel_description = "3 patients out of 100 will experience this bleeding event"
  end

    ### Begin QuestionDimension id:5 ###
    QuestionDimension.seed do |qd|
      qd.id = 5
      qd.question_id = 4
      qd.count = 2
      qd.image = File.open(Rails.root.join("app/assets/images/people/R_person.png"))
      qd.legend_description = "Symptomatic clot in the leg"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:5 ###

    ### Begin QuestionDimension id:6 ###
    QuestionDimension.seed do |qd|
      qd.id = 6
      qd.question_id = 4
      qd.count = 0
      qd.image = File.open(Rails.root.join("app/assets/images/people/Y_person.png"))
      qd.legend_description = "Life threatening clot in the lung"
      qd.help_text = "https://i.ytimg.com/vi/kfFsGiDda0A/hqdefault.jpg"
      qd.help_text_description = "Long stuff"
    end
    ### End QuestionDimension id:6 ###

  ### End Question id:4 ###

### End QuestionSet id:2 ###

### Generate images for questions 3&4###
Question.where(id: [3,4]).each(&:save)
