# -!- ruby -!-
class MicroemacsSpellingPlpl < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Polish (plpl)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20240903/Jasspa_MicroEmacs_20240903_spelling_plpl.zip"
  sha256 "24A35A921D6EA8E13BC3E5A32E72CA5C5802091AC25A40AEFC45A3366E56E83F"

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
