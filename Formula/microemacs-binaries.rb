# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250601"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20250601"
  if OS.linux?
    if Hardware::CPU.arm?
        ZIPPFX="bin/linux6-aarch64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250601_bin_linux_aarch_binaries.zip"
        sha256 "E0FF3F00133B7EC0A761C8F7A37E2B3052B88E3178F52CDAEF36E2E37C8ADD96"
    elsif Hardware::CPU.intel?
        ZIPPFX="bin/linux6-intel64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250601_bin_linux_intel_binaries.zip"
        sha256 "6A30D448E888A0E64985FE5F1A3D537EFAE9C6C39D62E7C82BB95B2C7AEE5DBF"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250601_bin_macos_apple_binaries.zip"
      sha256 "C35A27702DAD469E40E08433646BE29B97903D4061617627DDC7C12670D601E4"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250601_bin_macos_intel_binaries.zip"
      sha256 "7E8BB9561275863F09697C7DAC6F1E4BDC95616D15BEDC6A5C349BAE1AE50E7C"
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
