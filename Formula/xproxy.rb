class Xproxy < Formula
    desc "Socks5 Proxy"
    homepage "https://github.com/ruzztok/proxy-go"
    url "https://github.com/ruzztok/proxy-go/releases/download/v0.0.8/proxy_darwin_amd64.tar.gz"
    sha256 "821a8b35752a395d404938654d1a1b11d62e995accc11e267fc15e88cd137747"
    version "0.0.8"
    
    def install
      bin.install "proxy_darwin_amd64" => "xproxy"
      pkgetc.install "config.json"
    end

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
            <key>KeepAlive</key>
            <true/>
            <key>RunAtLoad</key>
            <true/>
          </dict>
        </plist>
      EOS
    end
  end