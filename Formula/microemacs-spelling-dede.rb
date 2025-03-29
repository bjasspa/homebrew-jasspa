# -!- ruby -!-
class MicroemacsSpellingDede < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Deutsch (dede)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250301"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250301/Jasspa_MicroEmacs_20250301_spelling_dede.zip"
  sha256 "0526C00FC67BACEE6F9E8E1A3B1D90E6283F5B0F9767C654A6C14B5F84F4C983"

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
