module SurveysHelper
  def display_set_header(question_set)
    title = content_tag :span, (question_set.title.blank? ? question_set.survey.default_set_title : question_set.title), class: 'set_title'
    subtitle = content_tag :span, (question_set.subtitle.blank? ? question_set.survey.default_set_subtitle : question_set.subtitle), class: 'set_subtitle'

    content_tag :div do
      title + subtitle
    end.html_safe
  end

  def question_col_offset(size)
    case size
    when 2
      content_tag(:div, '', class: 'col-md-2')
    when 3
      ''
    end
  end

  def question_col_class(size)
    case size
    when 2
      'col-md-4'
    when 3
      'col-md-4'
    end
  end

  def legend_col_offset(size)
    case size
    when 1
      content_tag(:div, '', class: 'col-md-4')
    when 2
      content_tag(:div, '', class: 'col-md-3')
    end
  end

  def legend_tooltip_title used, total
    percentage = used/total.to_f * 100

    "#{used} out of #{total} (#{percentage}%)"
  end
end
