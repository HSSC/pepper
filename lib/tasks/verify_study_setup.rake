require 'csv'

desc "Verify study setup document is in the correct format"
task verify: :environment do

  def extract_and_display_setup_value(setup_file, setup_hash)
    k,v = setup_file.shift
    puts "#{k}: #{v}"
    setup_hash[k] = v
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
        questions["QUESTION#{qindex}"]["OPTION#{index}"] = {"COUNT" => count, "COLOR" => color}
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

  setup_file_name = ENV['filename']  #located in config/studies folder
  raise "Unable to find config/studies/#{setup_file_name}.csv in config/studies folder" unless File.exists?(Rails.root.join("config/studies/#{setup_file_name}.csv"))

  setup_file = CSV.read(Rails.root.join("config/studies/#{setup_file_name}.csv"))

  # [["Begin Setup (DO NOT REMOVE LINES 1-10)", nil, nil, nil],
  # ["Study Identifier", "ABC123", nil, nil], 
  # ["Total N", "200", nil, nil], 
  # ["Default Question Title", "My Title", nil, nil], 
  # ["Default Question Subtitle", "My Subtitle", nil, nil], 
  # ["Default Legend Description", "My Legend", nil, nil], 
  # ["Default Legend Image", "person.png", "Additional image format example R_person.png", nil], 
  # ["Legend Definitions", "R", "Y", nil], 
  # ["Legend Descriptions", "Something red", "Something yellow", nil], 
  # ["Legend Help Text", "So this means something", "And this means something", nil], 
  # [nil, nil, nil, nil], 
  # ["Example Sets", "Simple", "Advanced", nil], 
  # [nil, "10R:5Y|20R:10Y", "10R:5Y|20R:10Y;T=Title|ST=Subtitle|LD=Legend Description", nil], 
  # [nil, nil, nil, nil], 
  # ["Begin Sets (DO NOT REMOVE)", nil, nil, nil], 
  # ["10R:5Y|20R:10Y", "10R:5Y|20R:10Y", "10R:5Y|20R:10Y", "10R:5Y|20R:10Y"], 
  # ["10R:5Y|20R:10Y;T=Title|ST=Subtitle|LD=Legend Description", "10R:5Y|20R:10Y;T=Title|ST=Subtitle|LD=Legend Description", "10R:5Y|20R:10Y;T=Title|ST=Subtitle|LD=Legend Description", "10R:5Y|20R:10Y;T=Title|ST=Subtitle|LD=Legend Description"]]

  2.times { puts ""}

  puts "##############  INPUT FILE ##############"
  puts setup_file.inspect
  puts "##############  INPUT FILE ##############"

  2.times { puts ""}
  
  setup_file.shift  # remove first line, it's just descriptive text and a warning
  
  puts "##############  PARSED VALUES ###########"
  setup_hash = {}

  8.times do
    extract_and_display_setup_value(setup_file, setup_hash)
  end
  puts "##############  PARSED VALUES ###########"

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
end
