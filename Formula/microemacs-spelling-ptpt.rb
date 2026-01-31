# -!- ruby -!-
class MicroemacsSpellingPtpt < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Portugues (ptpt)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20260101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20260101/Jasspa_MicroEmacs_20260101_spelling_ptpt.zip"
  sha256 "0B75FE076DF5F8F59439527FD09C2E97D15FB96537197E662D787404C00EADA5"

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{share}/jasspa/spelling") unless Dir.exist?("#{share}/jasspa/spelling")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/spelling") unless Dir.exist?("#{SHRPTH}/jasspa/spelling")
    Dir.glob("#{buildpath}/*").each do |bfn|
      if File.file?(bfn)
        fnm = File.basename(bfn)
        sfn = "#{share}/jasspa/spelling/#{fnm}"
        puts "Found file: spelling/#{fnm}"
        cp "#{bfn}","#{share}/jasspa/spelling"
        ln_sf sfn,"#{SHRPTH}/jasspa/spelling/#{fnm}"
      end
    end
  end

end
