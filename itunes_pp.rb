class ItunesPp < Formula
  desc ""
  homepage ""
  version "1.0"
  url "https://gist.githubusercontent.com/dnicolson/d88963a7d50fd7fa11220d27c7b65d08/raw/9b9193ce6303795ede1a26ac208c62fb94899a64/itunes_pp.c"
  sha256 "3ef2aba3b67be88dbb8194d213d764c6011f551c6bc2a04a857211b8ff1ef267"

  def install
    system "clang -framework IOKit -framework Carbon itunes_pp.c -o itunes_pp"
    bin.install "itunes_pp"
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
        <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/itunes_pp</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
    </dict>
    </plist>
    EOS
  end
end
