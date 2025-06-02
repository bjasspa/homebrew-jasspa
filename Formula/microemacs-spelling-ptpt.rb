# -!- ruby -!-
class MicroemacsSpellingPtpt < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Portugues (ptpt)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250601"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250601/Jasspa_MicroEmacs_20250601_spelling_ptpt.zip"
  sha256 "E95195E0813A1EDFC166E11EF2F57E62F533DCE287033E7006DDDF7B79ACB720"

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
