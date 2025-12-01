# -!- ruby -!-
class MicroemacsSpellingFrfr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Francais (frfr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20251201"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20251201/Jasspa_MicroEmacs_20251201_spelling_frfr.zip"
  sha256 "DCD65A278A621E4E5BA924B1F6A4C5353BB32A21204950374EBC728FE00BD1DB"

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
