# -!- ruby -!-
class MicroemacsSpellingEngb < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for British (engb)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250801"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250801/Jasspa_MicroEmacs_20250801_spelling_engb.zip"
  sha256 "12F9E49E073130C9F10CDDCB24F5FDED7A6A35AF6C28A9F761E2FE6B4F63B8AD"

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
