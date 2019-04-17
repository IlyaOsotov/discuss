use Mix.Config

config :ueberauth, UeberAuth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] }
  ]

config :ueberauth, UeberAuth.Strategy.Github.Oauth,
  client_id: "client_id",
  client_secret: "client_secret"
