# -!- ruby -!-
class MicroemacsSpellingElgr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Greek (elgr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250501"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250501/Jasspa_MicroEmacs_20250501_spelling_elgr.zip"
  sha256 "DC88EBE39C85FA6F5D4D02EF26F69E827CFBE8D5ADBFFCEAF8B3745BB5D3B1A1"

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
