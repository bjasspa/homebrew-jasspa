# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20250801"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20250801"
  if OS.linux?
    if Hardware::CPU.arm?
        ZIPPFX="bin/linux6-aarch64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250801_bin_linux_aarch_binaries.zip"
        sha256 "F852498FE2FD47FDB6FA7D6DD58FD98654F4AB367158F9902CE1440E515F44E8"
    elsif Hardware::CPU.intel?
        ZIPPFX="bin/linux6-intel64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20250801_bin_linux_intel_binaries.zip"
        sha256 "11C4DED22D97E9900FA729AE8C0E8BDCD572AD89C057347314277CEA6D7BE196"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250801_bin_macos_apple_binaries.zip"
      sha256 "9FC1C3FDF31F7260E53E5120340CD32FA10724BAA0B3B1DF3D26197B74DA5B3B"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20250801_bin_macos_intel_binaries.zip"
      sha256 "4AA95449C34AEE9BA30FFDA93D51E86522DF922BE9A75F56939B7A5E0732A757"
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
