class Cmd < Formula
    desc "A CLI for Cohere models"
    homepage "https://github.com/daulet/cmd"
    version "0.4.0"
  
    if Hardware::CPU.intel?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-amd64"
      sha256 "d12f33dac217a49a04354618e89ede1e9fd010ffd0b55175b71515dd61647688"
    elsif Hardware::CPU.arm?
      url "https://github.com/daulet/cmd/releases/download/v#{version}/cmd-darwin-arm64"
      sha256 "0184c2fc472993c12e0b1c1c7203d13808246aefe6c33044016ccf45eee51917"
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
  
  
