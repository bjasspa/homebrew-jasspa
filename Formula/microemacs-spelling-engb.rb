# -!- ruby -!-
class MicroemacsSpellingEngb < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for British (engb)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20251201"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20251201/Jasspa_MicroEmacs_20251201_spelling_engb.zip"
  sha256 "C6AC5FE669EAFB35A186C4CE3D83AEF8B61017ED484BC83781A7C4932F05D6A0"

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
