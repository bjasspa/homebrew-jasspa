# -!- ruby -!-
class MicroemacsSpellingFifi < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Finnish (fifi)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250701"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250701/Jasspa_MicroEmacs_20250701_spelling_fifi.zip"
  sha256 "367E5E39A7C102FC71E607D0AA9139BA7E8370E08BF167D890EC3E74E2A249BF"

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
