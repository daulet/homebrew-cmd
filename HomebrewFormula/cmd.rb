class Cmd < Formula
    desc "A CLI for Cohere models"
    homepage "https://github.com/daulet/cmd"
    version "0.2.0"
  
    if Hardware::CPU.intel?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-amd64"
      sha256 "bfc9e4cd37d1d695769963370558f66805cc8563e4b48d00fd16a3b8bf952722"
    elsif Hardware::CPU.arm?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-arm64"
      sha256 "c71f11a7f08a8c18f89cef9ae7eea17fa28e9e2a0f8d473d849c9d63adf45ecf"
    end
  
    def install
      if Hardware::CPU.intel?
          bin.install "cmd-darwin-amd64" => "cmd"
      elsif Hardware::CPU.arm?
          bin.install "cmd-darwin-arm64" => "cmd"
      end
    end
  
    test do
      system "#{bin}/cmd", "--help"
    end
  
    def caveats
      <<~EOS
        Set the COHERE_API_KEY environment variable to your Cohere API key:
  
        export COHERE_API_KEY="your_api_key"
  
        You can add the above line to your shell profile (e.g., ~/.bashrc, ~/.zshrc, or ~/.bash_profile) to have the variable automatically set in new shell sessions.
      EOS
    end
  end
  
  