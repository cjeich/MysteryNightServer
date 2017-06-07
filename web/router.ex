defmodule MysteryNight.Router do
  use MysteryNight.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MysteryNight do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index

    resources "/events", EventController do
      resources "/stations", StationController do
        resources "/locations", LocationController
      end

      resources "/teams", TeamController do
        resources "/users", UserController
      end
    end

    resources "/teams", TeamController
    resources "/stations", StationController
    resources "/locations", LocationController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MysteryNight do
  #   pipe_through :api
  # end
end
