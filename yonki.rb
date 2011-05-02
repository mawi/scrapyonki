#!/usr/bin/ruby
require 'rubygems'
require 'open-uri'
require 'nokogiri' 


url = "http://www.peliculasyonkis.com/"


root = Nokogiri::HTML(open(url))
file = File.new("lista.txt", "w")


root.xpath('.//*[@id="menucontainer"]/div[5]/ul[1]/span/center/b/a').each do |abc|  
  letter = Nokogiri::HTML(open(abc[:href])) 
  letter.xpath('.//*[@id="contentcontainer"]/div[2]/div/ul/li/a').each do |film|
    file.puts film.text
  end
end    

file.close