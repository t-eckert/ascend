defmodule Ascend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AscendWeb.Telemetry,
      # Start the Ecto repository
      Ascend.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ascend.PubSub},
      # Start Finch
      {Finch, name: Ascend.Finch},
      # Start the Endpoint (http/https)
      AscendWeb.Endpoint
      # Start a worker by calling: Ascend.Worker.start_link(arg)
      # {Ascend.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ascend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AscendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
