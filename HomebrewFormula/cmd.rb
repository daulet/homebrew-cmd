class Cmd < Formula
    desc "A CLI for Cohere models"
    homepage "https://github.com/daulet/cmd"
    version "0.3.3"
  
    if Hardware::CPU.intel?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-amd64"
      sha256 "8cb2cd5ad62d505fca7850317e95b7f3a98aff96f9e75bf3abbbd141d9f16744"
    elsif Hardware::CPU.arm?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-arm64"
      sha256 "d0df1eb2e8065ae739c88e83b3d0a7ff7f8ddc09e71cddde1bfb0df0becf2482"
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
  
  
