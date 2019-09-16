class ScrapesController < ApplicationController

  require 'open-uri'
  require 'nokogiri'

  #In both cases: scraper, scraper(2) I get an empty array


  def scraper(keyword)
    #in this example I get an empty array selecting the .c16H9d class
    url = "https://www.lazada.vn/catalog/?q=#{keyword}&_keyori=ss&from=input&spm=a2o4n.home.search.go.1905e1822eN5XO"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    keywords = []

    html_doc.search('.c16H9d a').each do |element|
       element.text.strip
       element.attribute('title').value.map { |word| word.include?(keywords) ? keywords.to_f/2 : word  }

  end

  #example 2, for this example I try to follow this:
  # https://medium.com/@LindaVivah/the-beginner-s-guide-scraping-in-ruby-cheat-sheet-c4f9c26d1b8c

  def scraper2(keyword)
    url = "https://www.lazada.vn/catalog/?q=#{keyword}&_keyori=ss&from=input&spm=a2o4n.home.search.go.1905e1822eN5XO"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    keywords =  []

    html_doc.search('.c3KeDq').search('.c16H9d a').each do |element|
      element.text.strip
       element.attribute('title').value.map { |word| word.include?(keywords) ? keywords.to_f/2 : word  }
    end

    #more deep class selection
    html_doc.search('.c5TXIP').search('.c3KeDq').search('.c16H9d a').each do |element|
      element.text.strip
       element.attribute('title').value.map { |word| word.include?(keywords) ? keywords.to_f/2 : word  }
    end



  end


end
