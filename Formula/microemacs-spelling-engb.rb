# -!- ruby -!-
class MicroemacsSpellingEngb < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for British (engb)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250301"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250301/Jasspa_MicroEmacs_20250301_spelling_engb.zip"
  sha256 "5AF2830EE8ADB3F186F95A0A6FE836D4E97D35B0A2AE2F45C9D39EABC342AFF0"

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
