cask "scribbles" do
  version "0.1.5"
  sha256 "229184d88bf0840d2f315842884bf7d6250ec76bdf79df2cf2cd0096c65187a7"

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
