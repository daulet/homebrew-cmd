class Cmd < Formula
    desc "A CLI for Cohere models"
    homepage "https://github.com/daulet/cmd"
    version "0.3.4"
  
    if Hardware::CPU.intel?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-amd64"
      sha256 "4e54220ac79e04b248fa92666bd9e46c283dda98b3ab80ffd1ae6136f853230a"
    elsif Hardware::CPU.arm?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-arm64"
      sha256 "5fb33ddbac634b3e1fbd293a8257747902db3835d3a9b4861ab4a80f19645890"
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
  
  
