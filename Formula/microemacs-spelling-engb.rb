# -!- ruby -!-
class MicroemacsSpellingEngb < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for British (engb)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241101/Jasspa_MicroEmacs_20241101_spelling_engb.zip"
  sha256 "8F9487A6486DE5B15C087C7563010F41B54C582E801F3E9D471729009EE54BF7"

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
