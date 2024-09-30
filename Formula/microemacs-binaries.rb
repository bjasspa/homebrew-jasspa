
class MicroemacsBinaries < Formula
  desc "MicroEmacs 24 Text Editor GUI Version"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240903"
  URLPFX="https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}_bin_"
  if OS.mac?
      if Hardware::CPU.arm?
          # Code for Apple Silicon (M1, M2, etc.)
          ZIPPFX="bin/macos14-apple64/"
          url "#{URLPFX}macos_apple_binaries.zip"
          sha256 "840E128556F9D772FCF88CBFFACA1A026C05041FD6B168C6ACF9DDA9B8259D3D"
      elsif Hardware::CPU.intel?
          ZIPPFX="bin/macos13-intel64/"
          url "#{URLPFX}macos_intel_binaries.zip"
          sha256 "F358F6CB3F738D7FD7AEF4C844F3A346A43DDFA06B0716D96772D899DE2F23A4"
      end
  elsif OS.linux?
      ZIPPFX="bin/linux5-intel64/"
      url "#{URLPFX}linux_binaries.zip"
      sha256 "22F436BE7E400BF56AAE3DC714494ED98413F243E02AED59DDB227F6BA424196"
  else
    odie "Unexpected OS, not linux or macos!"
  end

  def install
    libexec.install Dir["*"]
    (bin/"mew").write_env_script "#{libexec}/#{ZIPPFX}mew", :MEINSTALLPATH => "/home/linuxbrew/.linuxbrew/share/jasspa/"
    puts "start Microemacs with: MEPATH=~/.config/jasspa:macros:/home/linuxbrew/.linuxbrew/share/jasspa/spelling mew"
    puts "on MacOS replace /home/linuxbrew/.linuxbrew with /opt/homebrew for M1 Macs or /usr/local for Intel Macs"
  end
  
  def caveats 
      <<~EOS
        This application is better working if you install tools like
        xfontscale to select X11 TrueType fonts
      EOS
  end
  
  test do
    assert_match "MicroEmacs 24 - Date 2024/09/02 - linux", shell_output("#{bin}/mew -V")
  end
end
