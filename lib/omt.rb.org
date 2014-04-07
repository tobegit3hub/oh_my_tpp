#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class Page
  attr_accessor :contents

  def initialize
    @contents = []
  end
  
  def title(title)
    @contents << {:title => title}
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

end


class OhMyTpp
  attr_accessor :pages

  def initialize
    @pages = []
  end

  def load(file_name)
    self.instance_eval(File.read(file_name))
  end
  
  def page(title="title")
    page = Page.new
    page.title title
    @pages << page
    yield if block_given?
  end

  def text(content)
    pages[-1].text content
  end

  def link(url)
    pages[-1].link url
  end

  def image(url)
    pages[-1].image url
  end

  def audio(url)
    pages[-1].audio url
  end

  def video(url)
    pages[-1].video url
  end

end 


if __FILE__ == $0
  omt_file_name = ARGV.first
  omt = OhMyTpp.new
  omt.load omt_file_name
end

