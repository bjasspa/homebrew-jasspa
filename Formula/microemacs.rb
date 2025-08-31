# -!- ruby -!-
class Microemacs < Formula
  desc "Jasspa MicroEmacs Text Editor - Meta Package Terminal and GUI Version"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250801"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  # get the readme and LICENSE files from the macros dependency which should be in the cache
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250801/Jasspa_MicroEmacs_20250801_macros.zip"
  sha256 "7F56DB8C95F98EFC7057750F8387FF503ED68C62B9226DA7F5F4ADCB33B195C0"
  # Add more dependencies as needed
  depends_on "microemacs-binaries"
  depends_on "microemacs-macros"  
  depends_on "microemacs-help"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa") unless Dir.exist?("#{share}/jasspa")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa") unless Dir.exist?("#{SHRPTH}/jasspa")
    Dir.glob("#{buildpath}/*").each do |bfn|
      if File.file?(bfn)
        fnm = File.basename(bfn)
        sfn = "#{share}/jasspa/#{fnm}"
        puts "Found file: #{fnm}"
        cp "#{bfn}","#{share}/jasspa"
        ln_sf sfn,"#{SHRPTH}/jasspa/#{fnm}"
      end
    end
  end
end
