defmodule MysteryNight.PageController do
  use MysteryNight.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
