#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class OhMyTpp

  def initialized
    @pages
  end

  def load(file_name)
    self.instance_eval(File.read(file_name))
  end

  
  def page(title="title")
    puts "title = #{title}"
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
  omt = OhMyTpp.new
  file_name = ARGV.first
  omt.load file_name
end

