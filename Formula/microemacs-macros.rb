
class MicroemacsMacros < Formula
  desc "Jasspa MicroEmacs Text Editor - Macro files"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_macros.zip"
  sha256 "F92036BF751C4C9A02C7763985DA36E0CF94A034F03A6702826E33ABCB767277"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa/macros") unless Dir.exist?("#{share}/jasspa/macros")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/macros") unless Dir.exist?("#{SHRPTH}/jasspa/macros")
    Dir.entries("#{buildpath}/macros").each do |file|
      if File.file?(file)
        fnm = File.basename(file)
        sfn = "#{share}/jasspa/macros/#{fnm}"
        puts "Found file: macros/#{fnm}"
        cp "#{file}","#{share}/jasspa/macros"
        ln_sf sfn,"#{SHRPTH}/jasspa/macros/#{fnm}"
      end
    end
  end

end
