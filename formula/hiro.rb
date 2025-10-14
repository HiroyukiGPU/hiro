class Hiro < Formula
  desc "Hiro language CLI and interpreter"
  homepage "https://github.com/HiroyukiGPU/hiro"  # 実際のリポジトリURL
  url "https://github.com/HiroyukiGPU/hiro/releases/download/v0.1.17/hiro-0.1.17.tar.gz"
  sha256 "7b07c65418fa6a880cae3f65a1fc8bfea666e7ccb9da339db774b4adab1b631a"
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
