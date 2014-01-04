#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "./omt.rb"

# load the .omt and convert into .tpp
class OhMyTppTpp < OhMyTpp

  def load(file_name)
    super
    tpp_file_name = name_omt_to_tpp file_name
    make_tpp_file(tpp_file_name, @pages)
  end

  def name_omt_to_tpp(omt_file_name)
    puts "[omt tpp] name #{omt_file_name} to tpp"
    omt_file_name[0...-3] << "tpp"
  end
  
  def make_tpp_file(tpp_file_name, pages)
    File.open(tpp_file_name, "w") do |file|

      pages.each_with_index do |page, index|
        puts "[omt tpp] write page #{page.title} into tpp"
        file.puts "--newpage" unless index==0
        
        file.puts "--title #{page.title}"
        page.contents.each do |kv|
          puts "[omt tpp] write #{kv.values[0]}"
          file.puts kv.values[0]
        end
        file.puts ""
      end
      
    end
  end
  
end

if __FILE__ == $0
  file_name = ARGV.first
  omt = OhMyTppTpp.new
  omt.load file_name if file_name.end_with? ".omt"
end

