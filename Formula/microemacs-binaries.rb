# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250301"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20250301"
  if OS.linux?
    ZIPPFX="bin/linux5-intel64"
    url "#{URLPFX}/Jasspa_MicroEmacs_20250301_bin_linux_binaries.zip"
    sha256 "9A5B1B4053F4B032EE2F56C28DD837D1C557D2BCCA9275D2E368B3FFB270E54A"
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250301_bin_macos_apple_binaries.zip"
      sha256 "69C93F47E456007FEB4AE8CDDD3EE97529F5D3A937D0140317EEC0CA9DBDADB4"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250301_bin_macos_intel_binaries.zip"
      sha256 "CF71578C760E378AEE35A6E63C32DCD11EAB57B6F328D117B54B20F4CEC3AB66"
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
