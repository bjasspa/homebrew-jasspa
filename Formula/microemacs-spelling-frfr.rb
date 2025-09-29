# -!- ruby -!-
class MicroemacsSpellingFrfr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Francais (frfr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250901"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250901/Jasspa_MicroEmacs_20250901_spelling_frfr.zip"
  sha256 "09B6C391DC71AC440A9C1D29F93F02675109FA5E3BF18AEC58B6BA89658DF910"

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
