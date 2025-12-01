# -!- ruby -!-
class MicroemacsHelp < Formula
  desc "Jasspa MicroEmacs Text Editor - Help file"
  homepage "https://github.com/bjasspa/jasspa"
  version "20251201"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20251201/Jasspa_MicroEmacs_20251201_help_ehf.zip"
  sha256 "1764CFDACB53F96784023EA7E9D71EDDBB8241B17C0459D063D0B563E7D0190E"

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
