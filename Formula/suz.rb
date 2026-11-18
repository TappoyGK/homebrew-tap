class Suz < Formula
  desc "Statically typed programming language with checked arithmetic"
  homepage "https://github.com/TappoyGK/suz"
  url "https://github.com/TappoyGK/suz/releases/download/v0.3.4/suz-macos-arm64.tar.gz"
  sha256 "a284f7ae7a9543384d4f98efb3bb2ea7e6076aaa0b54f3e073aa29cc307d3653"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64
  depends_on :macos

  on_macos do
    depends_on macos: :tahoe
  end

  def install
    bin.install "suz"
  end

  test do
    # Suz controls its compiler flags and rejects overrides from the environment.
    %w[CFLAGS CPPFLAGS LDFLAGS].each { |name| ENV.delete(name) }
    assert_equal "suz v#{version}\n", shell_output("#{bin}/suz --version")
    (testpath/"hello.suz").write <<~SUZ
      fn main() -> u8 {
          log info `Hello, Suz!`
          return 0
      }
    SUZ
    system bin/"suz", "check", "hello.suz"
    system bin/"suz", "build", "hello.suz", "-o", "hello", "--cc", "/usr/bin/clang"
    assert_equal "info hello.suz:2: Hello, Suz!\n", shell_output("./hello 2>&1")
  end
end
