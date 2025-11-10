# -!- ruby -!-
class MicroemacsSpellingPlpl < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Polish (plpl)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20251101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20251101/Jasspa_MicroEmacs_20251101_spelling_plpl.zip"
  sha256 "2F91982B85C2D0BE59FC576387CA19136762D9AD41E6E72DE8788E59ABFE83A0"

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
