# -!- ruby -!-
class MicroemacsSpellingItit < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Italiano (itit)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250801"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250801/Jasspa_MicroEmacs_20250801_spelling_itit.zip"
  sha256 "4CF72939F5C9D2785921D2D16432AADA55D6B15ED6799C74F8484115C635D0C9"

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
