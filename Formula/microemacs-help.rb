# -!- ruby -!-
class MicroemacsHelp < Formula
  desc "Jasspa MicroEmacs Text Editor - Help file"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250701"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250701/Jasspa_MicroEmacs_20250701_help_ehf.zip"
  sha256 "4C456BA5F6E30CC2085FDF004E7431566C47A46118D1B05032BC4519387121CC"

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
