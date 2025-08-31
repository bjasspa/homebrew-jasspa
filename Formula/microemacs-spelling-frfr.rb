# -!- ruby -!-
class MicroemacsSpellingFrfr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Francais (frfr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250801"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250801/Jasspa_MicroEmacs_20250801_spelling_frfr.zip"
  sha256 "B43B5709D8D4C912048E848FD0159CAC99C778A8C70031B5DB9719B31EF5B60E"

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
