
class MicroemacsHelp < Formula
  desc "Jasspa MicroEmacs Text Editor - Help file"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_help_ehf.zip"
  sha256 "3CC3172C3B8F2EA0104ECC2E23D27D92E80DD0873285BDED7CEBD53D26D8ECF3"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa/macros") unless Dir.exist?("#{share}/jasspa/macros")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa") unless Dir.exist?("#{SHRPTH}/jasspa")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/macros") unless Dir.exist?("#{SHRPTH}/jasspa/macros")
    Dir.glob("#{buildpath}/macros/*").each do |file|
      fnm = File.basename(file)
      sfn = "#{share}/jasspa/macros/#{fnm}"
      puts "Found file: macros/#{fnm}"
      cp "#{file}","#{share}/jasspa/macros"
      ln_sf sfn, "#{SHRPTH}/jasspa/macros/#{fnm}"
    end  
  end

end
