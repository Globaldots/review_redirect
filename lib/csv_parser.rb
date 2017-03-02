require 'csv'

module ReviewRedirect
  class CSVParser
    CSVSETTINGS = {
      headers: true,
      header_converters: :symbol,
      col_sep: ';'
    }.freeze

    attr_accessor :file_path, :csv_row_number
    attr_reader :csv_content

    def initialize(args)
      @file_path = args[:file_path]
      @csv_row_number = 0
    end

    def original_url
      fetch_line[@csv_row_number][:original_domain].to_s + fetch_line[@csv_row_number][:original_path].to_s
    end

    def redirect_url
      fetch_line[@csv_row_number][:redirect_domain].to_s + fetch_line[@csv_row_number][:redirect_path].to_s
    end

    def fetch_line
      @csv_content ||= CSV.read(file_path, CSVSETTINGS)
    end

    def next
      @csv_row_number += 1
      current_line_number
    end

    def preview
      @csv_row_number -= 1
      current_line_number
    end

    def current_line_number
      @csv_row_number + 2
    end

    def count_line_numbers
      fetch_line.count
    end

    def end?
      fetch_line.count > @csv_row_number
    end
  end
end
