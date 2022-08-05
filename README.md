# Project 3
### Web-Scraping
About The Project
* This project uses Ruby to scrape data from a website and display certain information
* The website chosen originates from the osu site. The link is shown here https://cse.osu.edu/courses 
* The user inputs a .txt file of all the CSE courses they want to know about and the program outputs an html file of each course with a list or prerequisites and credit hours.

### Running The Program
* This project utilizes the Mechanize gem. This MUST be properly installed for the game to work.
  * If you don't have Bundler installed first enter ```$ gem install bundler```
  * You can check if you have it installed by entering ```$ bundle -v```
  * Next, type ```$ bundle install``` and enter. This installs all the required Ruby gems.
  * To run the program, type ```$ ruby main.rb``` and enter. 
* When the program starts, it will ask for an initial filename. Here is how it works:
  * **IMPORTANT: In a .txt file, list each course number one by one with each course having its own line**
  * Example .txt file: [sample_input.txt](https://github.com/cse3901-2022sp-giles/BitByBit-Web-Scraping/files/8102973/sample_input.txt)
  * Now simply enter your filename **without** the .txt extension and the program will run. (Ex: ```$ sample_input```)
* The output will be an **html file with the same name as the input file** that has all the information scraped from the website. Enjoy!

### Testing
* To run the test cases, enter ```$ cd test``` and then run the testScraper.rb file by entering ```$ ruby testScraper.rb```

### Project Development
* One of the hardest parts of this project was learning how to use the Ruby gem 'Mechanize'. After experimenting with the code, eventually the team was able to understand how web scraping worked and started working on our idea. 
* Another challenge the team had was unit testing some of the functions in the program. For example, the output_header, output_html functions were not able to have a thorough test case because it returned html code that changed depending on the the website. Also, the output_invalid_courses function was not able to be tested much due to the instance variable changing depending on the other functions. The team had to come up with other ways of testing a lot of these scraper methods. 
* Finally, if the team had more time, this project would be able to take input from various ways. Currently input is taken from a .txt file with strict conditions, but with more time, this program could be much more lenient towards how it takes in input. 


### Contributors 
* Shravun Sunkum
* Suyash Talekar
* Yusen Zhang
* Thomas Liu
