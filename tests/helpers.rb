def save_to_file filename, contacts
	File.open('gmail_contacts.out', 'w') do |f|
		f.puts contacts
	end
end

p "OK"
