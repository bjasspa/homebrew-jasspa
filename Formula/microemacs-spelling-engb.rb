
class MicroemacsSpellingEngb < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules British"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  url "https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_spelling_engb.zip"
  sha256 "35AF8D378BD0E895858233F8D651022C5BDA0BC1482018FAED305F742EBC4C8C"
  
  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa/spelling") unless Dir.exist?("#{share}/jasspa/spelling")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa") unless Dir.exist?("#{SHRPTH}/jasspa")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/spelling") unless Dir.exist?("#{SHRPTH}/jasspa/spelling")
    Dir.glob("#{buildpath}/spelling/*").each do |file|
      fnm = File.basename(file)
      sfn = "#{share}/jasspa/spelling/#{fnm}"
      puts "Found file: spelling/#{fnm}"
      cp "#{file}","#{share}/jasspa/spelling"
      ln_sf sfn, "#{SHRPTH}/jasspa/spelling/#{fnm}"
    end  
  end

end
