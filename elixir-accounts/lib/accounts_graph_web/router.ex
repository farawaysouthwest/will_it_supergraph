defmodule AccountsGraphWeb.Router do
  use AccountsGraphWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

     forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AccountsGraphWeb.Schema

    forward "/", Absinthe.Plug,
      schema: AccountsGraphWeb.Schema
  end
end
