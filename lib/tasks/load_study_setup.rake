require 'csv'

desc "Load study setup document"
task load: :environment do

  def extract_and_display_setup_value(setup_file, config_hash)
    row = setup_file.shift
    k = row.shift
    v = row.compact

    puts "#{k}: #{v.join(', ')}"
    config_hash[k] = v
  end

  def extract_sets(setup_file, set_hash, auto_id)
    sets = setup_file.shift.compact # remove any nil values, it's probably coming from Excel

    set_hash["PARTICIPANT#{auto_id}"] = {}

    sets.each_with_index do |set,index| 
      set_hash["PARTICIPANT#{auto_id}"]["SET#{index}"] = extract_set(set)
    end
  end

  def extract_set(set_data)
    raw_data,raw_descriptors = set_data.split(';')
    {"QUESTIONS" => extract_questions(raw_data), "DESCRIPTORS" => extract_descriptors(raw_descriptors)}
  end

  def extract_questions(raw_questions)
    questions = {}
   
    raw_questions.split('|').each_with_index do |xquestions, qindex|
      questions["QUESTION#{qindex}"] = {}
      xquestions.split(':').each_with_index do |q, index|
        count,color = q.gsub(/[^0-9]/, ''), q.gsub(/[^A-Za-z]/, '')
        questions["QUESTION#{qindex}"]["OPTION#{index}"] = {"COUNT" => count, "DIMENSION" => color}
      end
    end

    questions
  end

  def extract_descriptors(raw_descriptors)
    descriptors = {}
  
    raw_descriptors.split('|').each do |rd|
      k,v = rd.split('=', 2)
      descriptors["#{k}"] = v
    end unless raw_descriptors.nil?
    
    descriptors 
  end
  
  def setup_parameter_exists(config_hash, param)
    parameter = config_hash[param] || []
    disp_param = parameter.join(' ,')
    puts "#{param}: #{disp_param.blank? ? "false".colorize(:red) : disp_param.colorize(:green)}"
    parameter
  end

  setup_file_name = ENV['filename']  #located in config/studies folder
  raise "Unable to find config/studies/#{setup_file_name}.csv in config/studies folder\nUsage: rake load filename=abc123".colorize(:red) unless File.exists?(Rails.root.join("config/studies/#{setup_file_name}.csv"))

  setup_file = CSV.read(Rails.root.join("config/studies/#{setup_file_name}.csv"))

  2.times { puts ""}

  puts "##############  INPUT FILE ##############"
  puts setup_file.inspect
  puts "##############  INPUT FILE ##############"

  2.times { puts ""}
  
  setup_file.shift  # remove first line, it's just descriptive text and a warning
  
  puts "##############  SURVEY SETUP ###########"
  config_hash = {}

  until setup_file.first.at(0) == 'End Setup (DO NOT REMOVE)' do
    extract_and_display_setup_value(setup_file, config_hash)
  end
  puts "##############  SURVEY SETUP ###########"

  # iterate over the setup file until we get to where the sets begin
  setup_file.shift until setup_file.first.at(0) == 'Begin Sets (DO NOT REMOVE)'
  setup_file.shift # remove the line that says 'Begin Sets (DO NOT REMOVE)'

  set_hash = Hash.new({})
  auto_id = 0
  
  until setup_file.first.at(0) == 'End Sets (DO NOT REMOVE)'
    extract_sets(setup_file, set_hash, auto_id) 
    auto_id += 1
  end

  2.times { puts ""}

  set_hash.each do |participant,questions|
    puts "############## #{participant} #############"
    puts questions.inspect
    puts "############## #{participant} #############"
    puts ""
  end
  
  2.times { puts ""}

  # lets begin testing the configuration

  puts "##############  CREATING NEW SURVEY  ##############"

    study_identifier = setup_parameter_exists(config_hash, 'Study Identifier').first
    total_n = setup_parameter_exists(config_hash, 'Total N').first
    default_set_title = setup_parameter_exists(config_hash, 'Default Set Title').first
    default_set_subtitle = setup_parameter_exists(config_hash, 'Default Set Subtitle').first
    default_legend_description = setup_parameter_exists(config_hash, 'Default Legend Description').first
    default_legend_image = setup_parameter_exists(config_hash, 'Default Legend Image').first
    legend_definitions = setup_parameter_exists(config_hash, 'Legend Definitions')
    legend_help_text = setup_parameter_exists(config_hash, 'Legend Help Text')

    survey = Survey.new study_identifier: study_identifier,
                        total_n: total_n.to_i,
                        default_set_title: default_set_title,
                        default_set_subtitle: default_set_subtitle,
                        default_legend_description: default_legend_description,
                        default_legend_image: default_legend_image,
                        legend_definitions: legend_definitions,
                        legend_help_text: legend_help_text

    set_hash.each do |participant,questions|
      questions.each do |k, set|
        question_set = survey.question_sets.new participant_identifier: participant, descriptors: set["DESCRIPTORS"]
        set["QUESTIONS"].each do |ques, options|
          question_set.questions.new dimensions: options
        end
      end
    end

    if survey.save
      puts ""
      puts "Survey created"
    else
      puts ""
      puts "Survey creation failed with the following messages:"
      puts survey.errors.full_messages.join("\n").colorize(:red)
      puts ""
      puts "Run rake verify filename=#{setup_file_name} first"
    end
  
  puts "##############  CREATING NEW SURVEY  ##############"
  
  2.times { puts ""}
end
