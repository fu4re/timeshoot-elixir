defmodule Timeshoot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TimeshootWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Timeshoot.PubSub},
      # Start the Endpoint (http/https)
      TimeshootWeb.Endpoint
      # Start a worker by calling: Timeshoot.Worker.start_link(arg)
      # {Timeshoot.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Timeshoot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TimeshootWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
