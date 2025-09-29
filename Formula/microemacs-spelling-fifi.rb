# -!- ruby -!-
class MicroemacsSpellingFifi < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Finnish (fifi)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250901"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250901/Jasspa_MicroEmacs_20250901_spelling_fifi.zip"
  sha256 "C6781DA6ACEBE1E67F6B7B80B90D451EAAA6F729C687D56107D1B0B308A95363"

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
