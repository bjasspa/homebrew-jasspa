# -!- ruby -!-
class MicroemacsOpenssl < Formula
  desc "Jasspa MicroEmacs Text Editor - Open SSL libraries"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  SHRPTH="#{HOMEBREW_PREFIX}/share"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_20240903"
  depends_on "microemacs-binaries"
  if OS.linux?
    url "#{URLPFX}/Jasspa_MicroEmacs_20240903_bin_linux_openssl.zip"
    sha256 "C0167D5D6C1F8C7079A1600904B02DB1372514A56FD33F75380C1ACFF8B135D4"
  elsif OS.mac?
    if Hardware::CPU.arm?
      # Code for Apple Silicon (M1, M2, etc.)
      url "#{URLPFX}/Jasspa_MicroEmacs_20240903_bin_macos_apple_openssl.zip"
      sha256 "9B180CCE2E28EC3432B81A48B94EB35B713D184486E4B917D6329729F3C92FD7"
    elsif Hardware::CPU.intel?
      url "#{URLPFX}/Jasspa_MicroEmacs_20240903_bin_macos_intel_openssl.zip"
      sha256 "3A6743DF66ACF845E3A515A333510E6AF57F189CDB26AF95C43DA058BCB5E63B"
    else
      odie "Unexpected macOS Hardware, not arm or intel!"
    end
  else
    odie "Unexpected OS, not linux or macos!"
  end

  def install
    if OS.linux?
      lib.install "linux5-intel64/libcrypto.so"
      lib.install "linux5-intel64/libssl.so"          
    elsif Hardware::CPU.arm?
      lib.install "macos14-apple64/libssl.3.dylib"
      lib.install "macos14-apple64/libcrypto.3.dylib"
    elsif Hardware::CPU.intel?
      lib.install "macos13-intel64/libssl.3.dylib"
      lib.install "macos13-intel64/libcrypto.3.dylib"
    end
  end
  
end
