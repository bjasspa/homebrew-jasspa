# -!- ruby -!-
class MicroemacsMacros < Formula
  desc "Jasspa MicroEmacs Text Editor - Macro files"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250601"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250601/Jasspa_MicroEmacs_20250601_macros.zip"
  sha256 "D8ED25F47742D43D7F7BFFD216754A7DCB928D47237BB796E2E0F7AD8987B853"

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
