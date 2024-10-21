# -!- ruby -!-
class MicroemacsSpellingElgr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Greek (elgr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241001"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241001/Jasspa_MicroEmacs_20241001_spelling_elgr.zip"
  sha256 "FC69A892CF8E7F422DA4AC086BB0F4A1BA414574E50B5602EE7C14DC3A6C6590"

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
