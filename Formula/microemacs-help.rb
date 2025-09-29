# -!- ruby -!-
class MicroemacsHelp < Formula
  desc "Jasspa MicroEmacs Text Editor - Help file"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250901"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250901/Jasspa_MicroEmacs_20250901_help_ehf.zip"
  sha256 "4BDD9705480B2E56BD8984F331496D98E69CE888D4E4981EBA68A085041EFD4A"

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
