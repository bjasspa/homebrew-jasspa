# -!- ruby -!-
class MicroemacsSpellingRuru < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Russian (ruru)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250501"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250501/Jasspa_MicroEmacs_20250501_spelling_ruru.zip"
  sha256 "984964E51E0E943ACAB76E7F13EF5391962EA4256F3193EEE9281CD04B23F4B9"

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
