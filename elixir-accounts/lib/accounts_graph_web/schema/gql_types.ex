defmodule AccountsGraphWeb.Schema.GqlTypes do
  use Absinthe.Schema.Notation


  object :account do
    field :id, non_null(:id)
    field :user_id, non_null(:id)
    field :balance, non_null(:integer)
  end

end
