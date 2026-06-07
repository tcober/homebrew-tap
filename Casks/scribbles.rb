cask "scribbles" do
  version "0.1.3"
  sha256 "c45811c7cd4a13edb533654fb0f6925b2716258083a120cbbd84738f488fff41"

  url "https://github.com/tcober/Scribbles/releases/download/v#{version}/Scribbles-#{version}-arm64.dmg"
  name "Scribbles"
  desc "Audio note-taker with local Whisper transcription and LLM formatting"
  homepage "https://github.com/tcober/Scribbles"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Scribbles.app"

  zap trash: [
    "~/Library/Application Support/scribbles",
    "~/Library/Preferences/com.scribbles.app.plist",
    "~/Library/Saved Application State/com.scribbles.app.savedState",
  ]

  caveats <<~EOS
    Scribbles is not notarized by Apple. If macOS blocks it on first launch,
    reinstall without the download quarantine:

      brew reinstall --cask --no-quarantine #{token}

    (or allow it once under System Settings -> Privacy & Security -> "Open Anyway").

    Formatting notes requires Ollama with the gemma model:

      brew install ollama
      ollama pull gemma4
  EOS
end
