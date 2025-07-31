# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250701"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20250701"
  if OS.linux?
    if Hardware::CPU.arm?
        ZIPPFX="bin/linux6-aarch64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250701_bin_linux_aarch_binaries.zip"
        sha256 "C04AA9281D6AC994FF86B81AF1BDC6D7AF3D4E74839B842EDBFBF84CD9BDA321"
    elsif Hardware::CPU.intel?
        ZIPPFX="bin/linux6-intel64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250701_bin_linux_intel_binaries.zip"
        sha256 "E5440ED1C9855B5A6189C578102A4A99F26D22728AFEDF8D4B0BDFD11FFBDCC6"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250701_bin_macos_apple_binaries.zip"
      sha256 "DF5C9F3ED8DD18766300DA1993F9C9F9BF7F4F35F502B6A0CCDB3C006FC8E9E4"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250701_bin_macos_intel_binaries.zip"
      sha256 "DE3A2F29F56AE622593B450854746D510C9F75E790B83386685F42673E3DD119"
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
