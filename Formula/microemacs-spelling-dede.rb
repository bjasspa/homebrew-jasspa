# -!- ruby -!-
class MicroemacsSpellingDede < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Deutsch (dede)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250201"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250201/Jasspa_MicroEmacs_20250201_spelling_dede.zip"
  sha256 "3E63A83DCE216DC0E2CF39616134D24B03EC2E773EFFACD18D4F595F6EA3BC5E"

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
