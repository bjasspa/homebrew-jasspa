# -!- ruby -!-
class MicroemacsSpellingItit < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Italiano (itit)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250701"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250701/Jasspa_MicroEmacs_20250701_spelling_itit.zip"
  sha256 "B2A357992E6F717E96640E680E84F28566BFB26449043CA5EF76E484B59582D4"

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
