defmodule AccountsGraph.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AccountsGraphWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AccountsGraph.PubSub},
      # Start the Endpoint (http/https)
      AccountsGraphWeb.Endpoint
      # Start a worker by calling: AccountsGraph.Worker.start_link(arg)
      # {AccountsGraph.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AccountsGraph.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AccountsGraphWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
