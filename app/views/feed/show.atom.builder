<?xml version="1.0" encoding="UTF-8" ?><rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">
%channel
  %title= @title
  %description= "the product will make you happy"
  %link= "http://insane.com.ar"
  
  - @news_items.each do |item|
    %item
      %title= item.title
      %description= item.description
      %link= item.link
      %quality= item.quality
      %enclosure{  :url => item.link, :length => item.sizebytes, :type => 'application/x-bittorrent'}
      %pubDate= item.published