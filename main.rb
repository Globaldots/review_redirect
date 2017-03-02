require 'colorize'
require_relative 'lib/browser'
require_relative 'lib/csv_parser'

csv_path = 'example.csv'

csv = ReviewRedirect::CSVParser.new(file_path: csv_path)

while csv.end?
  browser = ReviewRedirect::Browser.new(url: csv.original_url)
  if csv.redirect_url == browser.redirect_url && browser.redirect?
    puts 'ok'.green
  else
    puts '>>> WRONG <<<'.red
    puts 'original_url: ' + csv.original_url.to_s 
    puts 'redirect_url: ' + csv.redirect_url.to_s
    puts 'status: ' + browser.status.to_s
    puts 'csv_line: ' + csv.current_line_number.to_s
    puts '>'.red * 6 + '<'.red * 6
  end
  csv.next
end


