# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20241101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20241101"
  if OS.linux?
    ZIPPFX="bin/linux5-intel64"
    url "#{URLPFX}/Jasspa_MicroEmacs_20241101_bin_linux_binaries.zip"
    sha256 "DAA6BD3E395EA5D0FA0594981B8680FD264186DF0D7F834655EFD81BE936AAEA"
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20241101_bin_macos_apple_binaries.zip"
      sha256 "AB162E781B1C4EA137DCC2241EBBE3CD3B5E16E367FB92972B35FBB313B37EF0"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20241101_bin_macos_intel_binaries.zip"
      sha256 "A93B0F149E354A3A0F2F2212F4D87E5A26618D8C32A519895A55F6A2583BFB36"
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
