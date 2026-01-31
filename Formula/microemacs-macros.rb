# -!- ruby -!-
class MicroemacsMacros < Formula
  desc "Jasspa MicroEmacs Text Editor - Macro files"
  homepage "https://github.com/bjasspa/jasspa"
  version "20260101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20260101/Jasspa_MicroEmacs_20260101_macros.zip"
  sha256 "7C8935D803D6783BEF29B57090F524C7FFF737DECDD945D32CAC0336DAC0552B"

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
