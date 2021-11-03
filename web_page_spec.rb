require 'byebug'
require_relative 'web_page'

RSpec.describe WebPage do
  describe '.ordered_desc_page_views' do
    it 'returns ordered by most to less webPages views count' do
      webpage0 = WebPage.new('/route/0', '0.0.0.0')
      webpage1 = WebPage.new('/route/1', '1.1.1.1')
      webpage2 = WebPage.new('/route/2', '2.2.2.2')
      webpage0.views += 2
      webpage2.views += 1
      web_pages = [webpage2, webpage0, webpage1]
      ordered_web_pages = WebPage.ordered_desc_page_views(web_pages)
      expect(ordered_web_pages).to match_array([webpage0, webpage2, webpage1])
    end
  end

  describe '.ordered_desc_unique_page_views' do
    it 'returns ordered by most to less webPages ips count' do
      webpage0 = WebPage.new('/route/0', '0.0.0.0')
      webpage1 = WebPage.new('/route/1', '1.1.1.1')
      webpage2 = WebPage.new('/route/2', '2.2.2.2')
      webpage0.ips << '000.000.000.000'
      webpage0.ips << '001.001.001.001'
      webpage2.ips << '222.222.222.222'
      web_pages = [webpage2, webpage1, webpage0]
      ordered_web_pages = WebPage.ordered_desc_unique_page_views(web_pages)
      expect(ordered_web_pages).to match_array([webpage0, webpage2, webpage1])
    end
  end
end
