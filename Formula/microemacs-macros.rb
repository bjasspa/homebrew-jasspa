
class MicroemacsMacros < Formula
  desc "MicroEmacs 24 Text Editor Macro files"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  url "https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_macros.zip"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  sha256 "F92036BF751C4C9A02C7763985DA36E0CF94A034F03A6702826E33ABCB767277"

  def install
    # Define the target directory
    macrofolder = "#{share}/jasspa/macros"
    # Create the directory if it does not exist
    require 'fileutils'
    puts "Got BUILD: #{buildpath}/"
    puts "Got LIBEXEC: #{libexec}/"
    puts "Got SHARE: #{share}/"
    puts "Got SHRPTH: #{SHRPTH}/"
    FileUtils.mkdir_p("#{share}/jasspa/macros") unless Dir.exist?("#{share}/jasspa/macros")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa") unless Dir.exist?("#{SHRPTH}/jasspa")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/macros") unless Dir.exist?("#{SHRPTH}/jasspa/macros")
    # Example: List files in the buildpath
    Dir.glob("#{buildpath}/macros/*").each do |file|
      puts "Found file: #{file}"
      cp "#{file}","#{share}/jasspa/macros"
      ("#{SHRPTH}/jasspa/macros").install_symlink "#{share}/jasspa/macros/#{file}"
    end  
    ### setting MEPATH for mews and mecs does not work, what could we do?
    puts "start Microemacs with: MEPATH=~/.config/jasspa:/home/linuxbrew/.linuxbrew/share/jasspa/macros:/home/linuxbrew/.linuxbrew/share/jasspa/spelling mec (or mew)"
    puts "on MacOS replace /home/linuxbrew/.linuxbrew with /opt/homebrew for M1 Macs or /usr/local for Intel Macs"
  end

end
