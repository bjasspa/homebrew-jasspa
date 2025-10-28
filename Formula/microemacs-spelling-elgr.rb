# -!- ruby -!-
class MicroemacsSpellingElgr < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Greek (elgr)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20251001"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20251001/Jasspa_MicroEmacs_20251001_spelling_elgr.zip"
  sha256 "E582A1B42B6E6799C8780071B6196639FA00237A785D9EEB1C16E7D01C8E438C"

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
