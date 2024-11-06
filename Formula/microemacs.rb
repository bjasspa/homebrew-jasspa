# -!- ruby -!-
class Microemacs < Formula
  desc "Jasspa MicroEmacs Text Editor - Meta Package Terminal and GUI Version"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  # get the readme and COPYING files from the macros dependency which should be in the cache
  url "https://github.com/bjasspa/jasspa/releases/download/me_20241101/Jasspa_MicroEmacs_20241101_macros.zip"
  sha256 "379CEB372FB43EBDB31920E72CF94BE70AD7AD8EA03A5AA755F04FFB7B6E4FD6"
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
