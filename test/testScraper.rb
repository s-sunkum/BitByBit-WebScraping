require 'minitest/autorun'
require '../lib/scraper.rb'

class Testscraper < MiniTest::Test

    def setup
        scraper = Scraper.new    
    end

    def test_initialize
        scraper = setup
        refute_nil scraper.page
    end

    def test_has_file_exists
        scraper = setup
        assert_respond_to scraper, :file_exists?
    end

    def test_file_exists_true
        scraper = setup
        filename = "test_file_exists_true"
        assert_equal true, (scraper.file_exists? filename)
    end

    def test_file_exists_false
        scraper = setup
        filename = "test_file_exists_false"
        assert_equal false, (scraper.file_exists? filename)
    end

    def test_has_read_input
        scraper = setup
        assert_respond_to scraper, :read_input
    end

    def test_read_input_normal_case
        scraper = setup 
        comparison = ["2221","2421","3901"]
        scraper.read_input "test_read_input_normal_case"
        assert_equal comparison, scraper.file_data
    end

    def test_read_input_empty_case
        scraper = setup
        comparison = []
        scraper.read_input "test_read_input_empty_case" 
        assert_equal comparison, scraper.file_data
    end

    def test_read_input_skipline_case
        scraper = setup
        comparison = ["2221","","2421","3901"]
        scraper.read_input "test_read_input_skipline_case"
        assert_equal comparison, scraper.file_data
    end

    def test_has_fill_data
        scraper = setup
        assert_respond_to scraper, :fill_data
    end

    def test_fill_data_invalid_case
        scraper = setup
        scraper.read_input "test_fill_data_invalid_case"
        scraper.fill_data
        assert_empty scraper.course_information
    end

    def test_fill_data_valid_case
        scraper = setup
        expected = false
        scraper.read_input "test_fill_data_valid_case"
        scraper.fill_data
        assert_equal expected, scraper.course_information.empty?
    end

    def test_has_output_header
        scraper = setup
        assert_respond_to scraper, :output_header
    end

    def test_has_output_html
        scraper = setup
        assert_respond_to scraper, :output_html
    end

    def test_has_output_invalid_courses
        scraper = setup
        assert_respond_to scraper, :output_invalid_courses
    end
end