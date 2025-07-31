# -!- ruby -!-
class MicroemacsMacros < Formula
  desc "Jasspa MicroEmacs Text Editor - Macro files"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250701"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250701/Jasspa_MicroEmacs_20250701_macros.zip"
  sha256 "3FC2B5A7972D82478D242A5F23C0BDFD1268D9209E87D670EB14A0826C213A0F"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa/macros") unless Dir.exist?("#{share}/jasspa/macros")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/macros") unless Dir.exist?("#{SHRPTH}/jasspa/macros")
    Dir.glob("#{buildpath}/macros/*").each do |bfn|
      if File.file?(bfn)
        fnm = File.basename(bfn)
        sfn = "#{share}/jasspa/macros/#{fnm}"
        puts "Found file: macros/#{fnm}"
        cp "#{bfn}","#{share}/jasspa/macros"
        ln_sf sfn,"#{SHRPTH}/jasspa/macros/#{fnm}"
      end
    end
  end

end
