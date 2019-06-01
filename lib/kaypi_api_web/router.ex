defmodule KaypiApiWeb.Router do
  use KaypiApiWeb, :router

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

  scope "/", KaypiApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", KaypiApiWeb do
    pipe_through :api

    resources "/user_types", UserTypeController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/credentials", CredentialController, except: [:new, :edit]
  end
end
