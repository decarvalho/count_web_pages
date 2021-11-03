class WebPage
  attr_accessor :route, :views, :ips

  def initialize(route, ips)
    @route = route
    @views = 1
    @ips = ips
  end

  def self.ordered_desc_page_views(web_pages)
    web_pages.sort_by { |web_page| -web_page.views }.each do |web_page|
      puts "#{web_page.route} #{web_page.views} visits."
    end
  end

  def self.ordered_desc_unique_page_views(web_pages)
    web_pages.sort_by { |web_page| -web_page.ips.size }.each do |web_page|
      puts "#{web_page.route} #{web_page.ips.size} unique views."
    end
  end
end
