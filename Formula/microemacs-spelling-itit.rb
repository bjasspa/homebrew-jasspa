# -!- ruby -!-
class MicroemacsSpellingItit < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Italiano (itit)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20260101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20260101/Jasspa_MicroEmacs_20260101_spelling_itit.zip"
  sha256 "0D10FCF6223431901D97C47E6F0DB607177C71E44D342C998A1B120E422A7D83"

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
