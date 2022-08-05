require "./lib/scraper.rb"

# scraper contains a page for "https://cse.osu.edu/courses"
scraper = Scraper.new

# loop until get existing file name
begin
    puts "Enter the name of your textfile (excluding extensions such as .txt): "
    filename = gets.chomp
end while !scraper.file_exists? filename

#read user input: course number
scraper.read_input(filename)

#get the course number, description and credit for user input course
scraper.fill_data

#generate a html file to display result
scraper.output_html(filename)

#output invalid user input to the console
scraper.output_invalid_courses






