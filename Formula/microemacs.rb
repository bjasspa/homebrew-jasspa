# -!- ruby -!-
class Microemacs < Formula
  desc "Jasspa MicroEmacs Text Editor - Meta Package Terminal and GUI Version"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250601"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  # get the readme and LICENSE files from the macros dependency which should be in the cache
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250601/Jasspa_MicroEmacs_20250601_macros.zip"
  sha256 "D8ED25F47742D43D7F7BFFD216754A7DCB928D47237BB796E2E0F7AD8987B853"
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
