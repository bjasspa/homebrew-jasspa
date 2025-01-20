# -!- ruby -!-
class MicroemacsHelp < Formula
  desc "Jasspa MicroEmacs Text Editor - Help file"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250101/Jasspa_MicroEmacs_20250101_help_ehf.zip"
  sha256 "34FB9FF7233CAA14274384A5A62373B9B437E8067551CA2A14DD1106927D9C8E"

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
