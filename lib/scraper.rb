require 'mechanize'

=begin
Scraper class makes a get request to the
cse courses website, scrapes information for
user requested courses and formats it into a
user-readable html page. It also reports invalid
courses to the user
=end

class Scraper

    attr_accessor :page, :file_data, :course_information

=begin
    Intializes a new mechanize object and makes a get request
    to the cse courses website
=end
    def initialize 
        agent = Mechanize.new 
        @page = agent.get "https://cse.osu.edu/courses"
        @course_information = {}
        @file_data = []
    end

=begin
    Returns true or false depending on if a
    file with the given filename exists

    @param filename
        The name of the file to check its existence
    
    @return
        if file exists
=end
    def file_exists?(filename)
        File.exist? filename + ".txt"
    end

=begin
    Reads input from a file into an array of strings

    @param filename
        The name of file to read input from
=end
    def read_input(filename)
        file = File.open(filename + ".txt")
        @file_data = file.readlines.map(&:chomp)
        file.close
    end

=begin
    Searches the scraped page for course information of
    user requested courses and stores them
=end
    def fill_data
        divs = @page.search("div.content-body")
        divs.each {|course|
            key = course.css("span.number").text[1..-2]
            if @file_data.include? key
                @file_data.delete_at(@file_data.index key)
                value = course.css("p.description").text
                @course_information[key] = value
            end
        }
    end

=begin
    Writes header html for the given output file

    @param output_file
        The file in which header html needs to be written
=end
    def output_header(output_file)
        output_file.write("<!DOCTYPE html>\n")
        output_file.write("<html>\n")
        output_file.write("<head>\n")
        output_file.write("<title>Course Information</title>\n")
        output_file.write("</head>\n")
    end

=begin
    Creates an html file with the given filename 
    to output course information for user requested
    courses

    @param filename
        The filename with which the html needs to be created
=end
    def output_html(filename)
        output_file = File.new(filename + ".html","w")
        output_header(output_file)
        output_file.write("<body>\n")
        output_file.write("<table border=\"1\">\n")
        output_file.write("<tr>\n")
        output_file.write("<th>Course Number</th>\n")
        output_file.write("<th>Course Information</th>\n")
        output_file.write("<th>Credit Hours</th>\n")
        output_file.write("</tr>\n")
        total = 0
        @course_information.each {|key,value|
            index = value.index("Units:")
            description = value.slice(0,index)
            credits = value.slice(index + 6, 3).to_i
            total += credits
            output_file.write("<tr>\n")
            output_file.write("<td>" + "CSE " + key + "</td>\n")
            output_file.write("<td>" + description + "</td>\n")
            output_file.write("<td>" + credits.to_s + "</td>\n")
            output_file.write("</tr>\n")
        }
        output_file.write("<tr>\n")
        output_file.write("<td colspan = \"2\">Total Credit Hours: </td>\n")
        output_file.write("<td>" + total.to_s + "</td>\n")
        output_file.write("</tr>\n")
        output_file.write("</table>\n")
        output_file.write("</body>\n")
        output_file.write("</html>\n")
        output_file.close
    end

=begin
    Outputs invalid courses from the list of user requested courses
=end
    def output_invalid_courses
        if @file_data.length > 0
            puts "Invalid Courses: \n"
            @file_data.each {|course|
                puts course + "\n"
            }
        end
    end
end





