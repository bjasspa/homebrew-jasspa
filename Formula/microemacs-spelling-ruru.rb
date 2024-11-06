# -!- ruby -!-
class MicroemacsSpellingRuru < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Russian (ruru)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241101/Jasspa_MicroEmacs_20241101_spelling_ruru.zip"
  sha256 "FAE63E7751C6C362033DB0AF92013676564F82752AE84A88617700E2D5FF564C"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa/spelling") unless Dir.exist?("#{share}/jasspa/spelling")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/spelling") unless Dir.exist?("#{SHRPTH}/jasspa/spelling")
    Dir.glob("#{buildpath}/*").each do |bfn|
      if File.file?(bfn)
        fnm = File.basename(bfn)
        sfn = "#{share}/jasspa/spelling/#{fnm}"
        puts "Found file: spelling/#{fnm}"
        cp "#{bfn}","#{share}/jasspa/spelling"
        ln_sf sfn,"#{SHRPTH}/jasspa/spelling/#{fnm}"
      end
    end
  end

end
