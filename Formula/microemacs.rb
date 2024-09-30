
class Microemacs < Formula
  desc "Jasspa MicroEmacs Text Editor - Meta Package Terminal and GUI Version"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  # get the readme and COPYING files from the macros dependency which should be in the cache
  url "https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_macros.zip"
  sha256 "F92036BF751C4C9A02C7763985DA36E0CF94A034F03A6702826E33ABCB767277"
  # Add more dependencies as needed
  depends_on "microemacs-binaries"
  depends_on "microemacs-macros"  
  depends_on "microemacs-help"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa") unless Dir.exist?("#{share}/jasspa")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa") unless Dir.exist?("#{SHRPTH}/jasspa")
    Dir.entries("#{buildpath}").each do |file|
      if File.file?(file)
        fnm = File.basename(file)
        sfn = "#{share}/jasspa/#{fnm}"
        puts "Found file: #{fnm}"
        cp "#{file}","#{share}/jasspa"
        ln_sf sfn,"#{SHRPTH}/jasspa/#{fnm}"
      end
    end
  end
end
