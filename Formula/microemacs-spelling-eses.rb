# -!- ruby -!-
class MicroemacsSpellingEses < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Espanol (eses)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241201"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241201/Jasspa_MicroEmacs_20241201_spelling_eses.zip"
  sha256 "1C251B5E85BA74177B4E34BF08E1B51309F001D3E0A6CA11BA443235045E584E"

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
