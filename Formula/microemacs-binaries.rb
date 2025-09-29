# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250901"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20250901"
  if OS.linux?
    if Hardware::CPU.arm?
        ZIPPFX="bin/linux6-aarch64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250901_bin_linux_aarch_binaries.zip"
        sha256 "79011630152F26CE7772D06A67D74FBE962609D94A323E5A912454D192179D79"
    elsif Hardware::CPU.intel?
        ZIPPFX="bin/linux6-intel64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250901_bin_linux_intel_binaries.zip"
        sha256 "006B63577718B92B0E8262C25599BC65D80BD9F22887AD3AC79D7EFC5D42E165"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250901_bin_macos_apple_binaries.zip"
      sha256 "B53464C897EA198141AECE33621208EB9C5B049C06570D3FC031358BE51F992A"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250901_bin_macos_intel_binaries.zip"
      sha256 "134ABCED992A2BDDDB007CEF9CC30D5A1D348B923F940A9B41B65853CC2E337A"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  else
    odie "Unexpected OS, not linux or macos!"
  end

  def install
    require 'fileutils'
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/macros") unless Dir.exist?("#{SHRPTH}/jasspa/macros")
    FileUtils.mkdir_p("#{SHRPTH}/jasspa/spelling") unless Dir.exist?("#{SHRPTH}/jasspa/spelling")
    libexec.install Dir["*"]
    (bin/"mew").write_env_script "#{libexec}/#{ZIPPFX}/mew", :MEINSTALLPATH => "#{SHRPTH}/jasspa/"
    (bin/"mec").write_env_script "#{libexec}/#{ZIPPFX}/mec", :MEINSTALLPATH => "#{SHRPTH}/jasspa/"
    bin.install_symlink "#{libexec}/#{ZIPPFX}/tfs"
  end
  
  def caveats 
    <<~EOS
      The GUI application requires an X server, install XQuartz on macOS.
    
      The GUI application is better working if you install tools like
        xfontscale to select X11 TrueType fonts
    EOS
  end
  
  test do
    assert_match "MicroEmacs 24 - Date 2024-09-03 - linux", shell_output("#{bin}/mec -V")
  end
end
