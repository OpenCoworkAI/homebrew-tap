cask "open-codesign" do
  version "0.2.0"

  on_arm do
    url "https://github.com/OpenCoworkAI/open-codesign/releases/download/v#{version}/open-codesign-#{version}-arm64.dmg",
        verified: "github.com/OpenCoworkAI/open-codesign/"
    sha256 "b1351332358e31cc70a2f99c68ef2e8e7205da3c03c4901bd5e7dee045f62d0f"
  end
  on_intel do
    url "https://github.com/OpenCoworkAI/open-codesign/releases/download/v#{version}/open-codesign-#{version}-x64.dmg",
        verified: "github.com/OpenCoworkAI/open-codesign/"
    sha256 "b65b516c79f5c14ba6ba90382cbfe8263e7a709ce8a35356272baa065a5049b9"
  end

  name "Open CoDesign"
  desc "Open-source desktop AI design tool — prompt to prototype, BYOK, local-first"
  homepage "https://opencoworkai.github.io/open-codesign/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :big_sur"

  app "Open CoDesign.app"

  # Unsigned build — macOS will refuse the first launch with a generic
  # "damaged, move to Trash" dialog. Code-signing + notarization is on the
  # Stage-2 roadmap; until then users need the xattr workaround below.
  caveats <<~EOS
    #{token} is not yet notarized. On first launch macOS may refuse to open
    it. To bypass, either right-click the app and choose Open, or run:

      xattr -d com.apple.quarantine /Applications/Open CoDesign.app

    You only need to do this once per install/update.
  EOS

  zap trash: [
    "~/Library/Application Support/open-codesign",
    "~/Library/Preferences/ai.opencowork.codesign.plist",
    "~/Library/Logs/open-codesign",
    "~/Library/Saved Application State/ai.opencowork.codesign.savedState",
  ]
end
