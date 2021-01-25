class Kcptun < Formula
  desc "kcptun"
  homepage "https://github.com/xtaci/kcptun"
  url "https://github.com/xtaci/kcptun/releases/download/v20190401/kcptun-darwin-amd64-20190401.tar.gz"
  version "20190401"
  sha256 "16919653b98c377c9004fda3198faec4144349788e11a7eaabc73e815becbdb0"

  def install

    bin.install 'client_darwin_amd64' => 'kcptun-client'
    bin.install 'server_darwin_amd64' => 'kcptun-server'

    (buildpath/"kcptun.json").write <<~EOS
      {
          "remoteaddr":"KCP_SERVER_IP:4000",
          "localaddr":":8388",
          "mode":"fast3"
      }
    EOS
    (etc/"kcptun").mkpath
    etc.install "kcptun.json" => "kcptun/config.json"
  end

  plist_options :manual => "kcptun-client -c #{HOMEBREW_PREFIX}/etc/kcptun/config.json"

  def plist; <<~EOS
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>RunAtLoad</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/kcptun-client</string>
        <string>-c</string>
        <string>#{etc}/kcptun/config.json</string>
      </array>
    </dict>
  </plist>
  EOS
  end
  
  test do
    system "#{bin}/kcptun-client", "--version"
  end
end