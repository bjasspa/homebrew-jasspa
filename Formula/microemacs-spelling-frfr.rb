# -!- ruby -!-
class MicroemacsSpellingFrfr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Francais (frfr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250301"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250301/Jasspa_MicroEmacs_20250301_spelling_frfr.zip"
  sha256 "15611BC85C1B5E224DA72988572E73CF86F498567B770798AC7DBB2CFB3F9579"

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
