# -!- ruby -!-
class MicroemacsSpellingFifi < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Finnish (fifi)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250601"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250601/Jasspa_MicroEmacs_20250601_spelling_fifi.zip"
  sha256 "A5CEEBBFE3943BC288078BD02B6A363EE9A8155A0738C5A44801AD8FDFAD0A59"

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
