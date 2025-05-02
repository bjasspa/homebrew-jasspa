# -!- ruby -!-
class MicroemacsSpellingFrfr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Francais (frfr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250501"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250501/Jasspa_MicroEmacs_20250501_spelling_frfr.zip"
  sha256 "CCF3248C0A4B59A5481376B5EFB0DE7ABDBEF717EF6B9E4718B4501A65182D8B"

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
