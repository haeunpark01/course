defmodule Course.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Course.Repo,
      # Start the Telemetry supervisor
      CourseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Course.PubSub},
      # Start the Endpoint (http/https)
      CourseWeb.Endpoint
      # Start a worker by calling: Course.Worker.start_link(arg)
      # {Course.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Course.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CourseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
