defmodule WechatApplet.Mixfile do
  use Mix.Project

  def project do
    [app: :wechat_applet,
     version: "0.1.0",
     elixir: "~> 1.4",
     description: "This package provides basic functions for Wechat applet.",
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, "~> 2.0 or ~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md),
      maintainers: ["LcpMarvel"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/LcpMarvel/wechat_applet"}
    ]
  end
end
