import Config

config :logger,
backends: [:console, {LoggerFileBackend, :file}],
level: :debug

config :logger, :file,
path: "log/helloworld.log",
level: :debug,
format: "$time $metadata[$level] $message\n",
metadata: [:module, :function]
