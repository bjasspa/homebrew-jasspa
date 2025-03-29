# -!- ruby -!-
class MicroemacsSpellingPtpt < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Portugues (ptpt)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250301"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250301/Jasspa_MicroEmacs_20250301_spelling_ptpt.zip"
  sha256 "823CB42C8EB74BF3118DE15C2B20EA5E917CD34EDB1CA4EAD14E1F30E0DD561E"

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
