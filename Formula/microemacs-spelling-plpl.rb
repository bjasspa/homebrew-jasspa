# -!- ruby -!-
class MicroemacsSpellingPlpl < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Polish (plpl)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250901"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250901/Jasspa_MicroEmacs_20250901_spelling_plpl.zip"
  sha256 "D3A183F57C8B8A3B69B32E7E6A8F55F2430A8A352D553FE850596A707F8E28FC"

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
