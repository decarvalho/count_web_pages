#!/usr/bin/ruby
require_relative 'web_page'

class CountWebPages
  def self.run(file)
    web_pages = []

    File.open(file).each do |line|
      log = line.split(' ')
      web_page = web_pages.select { |page| page.route == log[0] }.first
      if web_page.nil?
        web_page = WebPage.new(log[0], [log[1]])
        web_pages << web_page
      else
        web_page.ips << log[1] unless web_page.ips.include? log[1]
      end
      web_page.views += 1
    end

    web_pages
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.length != 1
    raise ArgumentError, "Usage: ruby #{$PROGRAM_NAME} log_file"
  end

  web_pages = CountWebPages.run ARGV[0]
  WebPage.ordered_desc_page_views(web_pages)
  WebPage.ordered_desc_unique_page_views(web_pages)
end
