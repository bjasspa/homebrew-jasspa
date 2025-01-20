# -!- ruby -!-
class MicroemacsSpellingEses < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Espanol (eses)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250101/Jasspa_MicroEmacs_20250101_spelling_eses.zip"
  sha256 "47A31879936DBFBABCCC25EAD0BAB6B9A7F4EC2508EF1A184A1ACE2BDADADD82"

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
