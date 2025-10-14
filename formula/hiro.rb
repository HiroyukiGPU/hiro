class Hiro < Formula
  desc "Hiro language CLI and interpreter"
  homepage "https://github.com/HiroyukiGPU/hiro"
  url "https://github.com/HiroyukiGPU/hiro/releases/download/v0.1.17/hiro-0.1.17.tar.gz"
  sha256 "c8294a77b3dcbfb5fbababde0a3c048459c643a65417f182fe608ff772d68995"
  license "MIT"

  depends_on "node" # Node実行ラッパー方式のため

  def install
    libexec.install "lib/hiro"
    bin.install "bin/hiro"
    # bin配下のhiroがlibexec配下を参照するように書き換え
    inreplace bin/"hiro", "/usr/local/lib/hiro", libexec/"hiro"
  end

  test do
    (testpath/"hello.hiro").write <<~EOS
      Hiro Osyaberi ==> ("ok")🐧
    EOS
    assert_match "ok", shell_output("#{bin}/hiro -npm hello.hiro")
  end
end