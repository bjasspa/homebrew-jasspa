# -!- ruby -!-
class MicroemacsSpellingEses < Formula
  desc "Jasspa MicroEmacs Text Editor - Spelling Rules for Espanol (eses)"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250701"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20250701/Jasspa_MicroEmacs_20250701_spelling_eses.zip"
  sha256 "C73DFE930982DD6EF5C0C4B8A7972DDF56D9CC458F3ED40793EB216AF8196624"

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
