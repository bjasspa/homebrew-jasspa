# -!- ruby -!-
class MicroemacsBinaries < Formula
  desc "Jasspa MicroEmacs Text Editor - Terminal & GUI Binaries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20251101"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20251101"
  if OS.linux?
    if Hardware::CPU.arm?
        ZIPPFX="bin/linux6-aarch64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20251101_bin_linux_aarch_binaries.zip"
        sha256 "4876927500D35B805D702158FD53171EBC3C0C5629E86C94C5D3E6E197D0309E"
    elsif Hardware::CPU.intel?
        ZIPPFX="bin/linux6-intel64"
        url "#{URLPFX}/Jasspa_MicroEmacs_20251101_bin_linux_intel_binaries.zip"
        sha256 "0178AA26104DF9CB601C1D12DF39659D0A48D0A8AC318D9AF5B3D811A8454E2C"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      ZIPPFX="bin/macos14-apple64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20251101_bin_macos_apple_binaries.zip"
      sha256 "35EC7613D8298CB82061E484176801E024F1061BBCDE35411B9D00408396E948"
    elsif Hardware::CPU.intel?
      ZIPPFX="bin/macos13-intel64"
      url "#{URLPFX}/Jasspa_MicroEmacs_20251101_bin_macos_intel_binaries.zip"
      sha256 "21710BB958EE4397CB363FBA7426BAE22D0CBA5867DDEC7B141728D1B55C4F39"
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
