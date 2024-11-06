# -!- ruby -!-
class MicroemacsSpellingPtpt < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Portugues (ptpt)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241101/Jasspa_MicroEmacs_20241101_spelling_ptpt.zip"
  sha256 "F670B4FC65F9D505DC9D0C188EA5257FDCF852080E59A32A1DCFF73FE7691360"

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
