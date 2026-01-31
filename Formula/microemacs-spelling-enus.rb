# -!- ruby -!-
class MicroemacsSpellingEnus < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for American (enus)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20260101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20260101/Jasspa_MicroEmacs_20260101_spelling_enus.zip"
  sha256 "FAD42D2889FC288A9A8E57C5250BC6AE05DD5D949D5BBB90185D62EF095E2828"

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
