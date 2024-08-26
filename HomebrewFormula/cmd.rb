class Cmd < Formula
    desc "A CLI for Cohere models"
    homepage "https://github.com/daulet/cmd"
    version "0.3.0"
  
    if Hardware::CPU.intel?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-amd64"
      sha256 "f86f6aa8864fabb64e91fd2687ec8f71ae26b90d97815bb09641db88425ea5f3"
    elsif Hardware::CPU.arm?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-arm64"
      sha256 "3165651af0960271d61805f3fff9c28ec2c1bc8959d90be03ec8c49098f0540b"
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
        Set the COHERE_API_KEY or GROQ_API_KEY environment variable, depending on chosen provider:
  
        export COHERE_API_KEY="your_cohere_api_key"
        or
        export GROQ_API_KEY="your_groq_api_key"
  
        You can add the above line to your shell profile (e.g., ~/.bashrc, ~/.zshrc, or ~/.bash_profile) to have the variable automatically set in new shell sessions.
      EOS
    end
  end
  
  
