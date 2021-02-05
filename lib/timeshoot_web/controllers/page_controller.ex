defmodule TimeshootWeb.PageController do
  use TimeshootWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
