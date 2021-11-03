require 'byebug'
require_relative 'count_web_pages'

RSpec.describe CountWebPages do
  subject { described_class.run argument }

  context 'when there is log file as argument' do
    let(:argument) { 'webserver.log' }

    context 'visits' do
      it 'count 91 visits for /about/2 route' do
        web_page = subject.select { |page| page.route == '/about/2' }.first
        expect(web_page.views).to eq 91
      end

      it 'count 90 visits for /contact route' do
        web_page = subject.select { |page| page.route == '/contact' }.first
        expect(web_page.views).to eq 90
      end

      it 'count 83 visits for /index route' do
        web_page = subject.select { |page| page.route == '/index' }.first
        expect(web_page.views).to eq 83
      end

      it 'count 82 visits for /about route' do
        web_page = subject.select { |page| page.route == '/about' }.first
        expect(web_page.views).to eq 82
      end

      it 'count 81 visits for /help_page/1 route' do
        web_page = subject.select { |page| page.route == '/help_page/1' }.first
        expect(web_page.views).to eq 81
      end

      it 'count 79 visits for /home route' do
        web_page = subject.select { |page| page.route == '/home' }.first
        expect(web_page.views).to eq 79
      end
    end

    context 'unique views' do
      it 'count 22 unique views for /about/2 route' do
        web_page = subject.select { |page| page.route == '/about/2' }.first
        expect(web_page.ips.size).to eq 22
      end

      it 'count 23 unique views for /contact route' do
        web_page = subject.select { |page| page.route == '/contact' }.first
        expect(web_page.ips.size).to eq 23
      end

      it 'count 23 unique views for /index route' do
        web_page = subject.select { |page| page.route == '/index' }.first
        expect(web_page.ips.size).to eq 23
      end

      it 'count 21 unique views for /about route' do
        web_page = subject.select { |page| page.route == '/about' }.first
        expect(web_page.ips.size).to eq 21
      end

      it 'count 23 unique views for /help_page/1 route' do
        web_page = subject.select { |page| page.route == '/help_page/1' }.first
        expect(web_page.ips.size).to eq 23
      end

      it 'count 23 unique views for /home route' do
        web_page = subject.select { |page| page.route == '/home' }.first
        expect(web_page.ips.size).to eq 23
      end
    end
  end
end
