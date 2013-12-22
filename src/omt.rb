#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class Page
  attr_accessor :contents

  def initialize
    @contents = {}
  end
  
  def title(title)
    @contents[title] = :title
  end

  def text(content)
    @contents[content] = :text
  end

end


class OhMyTpp

  def initialize
    @pages = []
  end

  def load(file_name)
    self.instance_eval(File.read(file_name))
  end
  
  def page(title="title")
    puts "title = #{title}"
    page = Page.new
    page.title title
    @pages << page
    yield if block_given?
  end

  def text(content)
    puts "content = #{content}"
  end

  def link(url)
    puts "link = #{url}"
  end

  def image(url)
    puts "image = #{url}"
  end

  def audio(url)
    puts "audio = #{url}"
  end

  def video(url)
    puts "audio = #{url}"
  end

end 


if __FILE__ == $0
  omt_file_name = ARGV.first
  omt = OhMyTpp.new
  omt.load omt_file_name
end

