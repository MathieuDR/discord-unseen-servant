[
  import_deps: [
    :ecto,
    :typed_struct
  ],
  subdirectories: ["priv/*/migrations"],
  plugins: [Styler],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
