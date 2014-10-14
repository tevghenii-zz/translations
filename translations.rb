# Sort keys and group them
# translations localizable.en > outfile

# Read file 
filename = ARGV[0]
contents = File.readlines(filename)

# Sort, remove duplicates, remove blank lines
contents = contents.uniq.sort
contents = contents - ["", "\n"]

# Extract notification keys
notifications = Array.new
contents.each do |line|
	key = line.split('=').first
	if key.match(/[a-z]/) == nil
		notifications.push(line)
	end
end
contents = contents - notifications

# Group lines by keys
grouped = Array.new
contents.each_with_index do |line, index|
	grouped.push(line);
	if (line == contents.last)
		break
	end
	key0 = line.split('_').first
	key1 = contents[index+1].split('_').first	
	if (key0 != key1)
		grouped.push("\n")
	end
end

contents = grouped + ["\n"] + notifications

puts contents