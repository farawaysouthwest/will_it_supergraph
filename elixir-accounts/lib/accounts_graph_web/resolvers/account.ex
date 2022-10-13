defmodule AccountsGraphWeb.Resolvers.Accounts do

  def list_accounts(_parent, _args, _resolution) do
    {:ok, [
  %{id: "100", user_id: "1", balance: 123},
  %{id: "200", user_id: "2", balance: 5623},
]}
  end

  def get_account(parent, _args, _resolution) do
   {:ok, Enum.find([
  %{id: "100", user_id: "1", balance: 123},
  %{id: "200", user_id: "2", balance: 5623},
], &(&1.user_id == parent.id))}
  end

end
