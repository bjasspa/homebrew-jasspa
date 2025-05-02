# -!- ruby -!-
class MicroemacsSpellingFifi < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Finnish (fifi)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250501"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250501/Jasspa_MicroEmacs_20250501_spelling_fifi.zip"
  sha256 "BDAAD216AC8E7B04D4DE168B5BE9D109F4BE4CB3D0130D025C6C4D274EB2E705"

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
