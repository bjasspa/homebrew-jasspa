# -!- ruby -!-
class MicroemacsSpellingDede < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Deutsch (dede)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241001"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241001/Jasspa_MicroEmacs_20241001_spelling_dede.zip"
  sha256 "81B285F8721DD87056DE700FC87CCA0910291ED1DF0A342B72DFFE55ADE0D3B1"

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
