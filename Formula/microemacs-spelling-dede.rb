# -!- ruby -!-
class MicroemacsSpellingDede < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Deutsch (dede)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250801"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250801/Jasspa_MicroEmacs_20250801_spelling_dede.zip"
  sha256 "81621372A0D31DB1DBFF7E44B25A593A8CC45DD7141F3880C76A8AE94D60314F"

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
