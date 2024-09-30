
class Microemacs < Formula
  desc "Jasspa MicroEmacs Text Editor - Meta Package Terminal and GUI Version"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  # get the readme and COPYING files from the macros dependency which should be in the cache
  url "https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_macros.zip"
  sha256 "38f30e3005aa9bf7bd3c606d7f01fdb79467890219c138d09e2123d12eda75c0"
  # Add more dependencies as needed
  depends_on "microemacs-binaries"
  depends_on "microemacs-macros"  
  depends_on "microemacs-help"

  def install
    jasspafolder = "#{share}/jasspa/"
    # Create the directory if it does not exist
    require 'fileutils'
    FileUtils.mkdir_p(jasspafolder) unless Dir.exist?(jasspafolder)
    # Example: List files in the buildpath
    Dir.entries("#{buildpath}/*").each do |file|
      fnm = File.basename(file)
      sfn = "#{share}/jasspa/#{fnm}"
      puts "Found file: #{fnm}"
      cp "#{file}","#{share}/jasspa"
      ln_sf sfn, "#{SHRPTH}/jasspa/#{fnm}"
    end  
  end
end
