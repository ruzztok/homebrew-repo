class Xproxy < Formula
    desc "Socks5 Proxy"
    homepage "https://github.com/ruzztok/proxy-go"
    url "https://github.com/ruzztok/proxy-go/releases/download/v0.0.7/proxy_darwin_amd64.tar.gz"
    sha256 "4a1dda114191bc5c457633ec5bd49895eb9592318ae78b0a255d899aa75d6aaf"
    # license ""
  
    def install
      bin.install "proxy_darwin_amd64" => "xproxy"
      pkgetc.install "config.json"
    end

    # plist_options manual: "xproxy -c=#{HOMEBREW_PREFIX}/etc/xproxy/config.json"

    def plist
      <<~EOS
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
          <dict>
            <key>Label</key>
            <string>#{plist_name}</string>
            <key>ProgramArguments</key>
            <array>
              <string>#{bin}/xproxy</string>
              <string>-c</string>
              <string>#{etc}/xproxy/config.json</string>
            </array>
          </dict>
        </plist>
      EOS
    end
  end