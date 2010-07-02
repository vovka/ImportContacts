def save_to_file filename, contacts
  File.open(filename, 'w') do |f|
    f.puts contacts
  end
end

def load_config config_file_path
  file = File.new(config_file_path, "r")
  yaml_user_info = ''
  while (line = file.gets)
    yaml_user_info << line
  end
  file.close
  yaml_user_info
end

