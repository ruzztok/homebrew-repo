class Xproxy < Formula
    desc "Socks5 Proxy"
    homepage "https://github.com/ruzztok/proxy-go"
    url "https://github.com/ruzztok/proxy-go/releases/download/v0.0.7/proxy_darwin_amd64.tar.gz"
    sha256 "4a1dda114191bc5c457633ec5bd49895eb9592318ae78b0a255d899aa75d6aaf"
    # license ""
  
    def install
      bin.install "proxy_darwin_amd64" => "xproxy"
      etc.install "config.json" => "xproxy/config.json"
    #   share.install "xxx" => ""
    end

    plist_options manual: "xproxy -c=#{HOMEBREW_PREFIX}/etc/xproxy/config.json"
  end