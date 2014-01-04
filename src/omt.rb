#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# the page containing all the contents
class Page
  attr_accessor :title, :contents

  def initialize(title)
    @title = title
    @contents = []
  end

  def text(content)
    @contents << {:text => content}
  end

  def link(url)
    @contents << {:link => url}
  end

  def image(url)
    @contents << {:image => url}
  end

  def audio(url)
    @contents << {:audio => url}
  end

  def video(url)
    @contents << {:video => url}
  end

  def to_s
    @contents
  end
  
end

# basic class to load .omt file
class OhMyTpp
  attr_accessor :pages, :file_name

  def initialize
    @pages = []
  end

  def load(file_name)
    puts "[omt] load the file #{file_name}"
    @file_name = file_name
    self.instance_eval(File.read(file_name))
  end

  def page(title, &block)
    puts "[omt] load the page #{title}"
    page = Page.new(title)
    page.instance_eval(&block)
    @pages << page
  end

  def to_s
    @pages
  end
  
end 


if __FILE__ == $0
  file_name = ARGV.first
  omt = OhMyTpp.new
  omt.load file_name if file_name.end_with? ".omt"
end

