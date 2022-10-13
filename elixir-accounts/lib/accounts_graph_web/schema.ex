defmodule AccountsGraphWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Federation.Schema

  import_types AccountsGraphWeb.Schema.GqlTypes

  alias AccountsGraphWeb.Resolvers

  query do

    @desc "get all accounts"
    field :all_accounts, list_of(:account) do
      resolve &Resolvers.Accounts.list_accounts/3
    end
  end

  object :user do
    key_fields "id"
    extends()

    field :id, non_null(:id) do
    external()
    end

    field :account, :account do
      resolve &Resolvers.Accounts.get_account/3
    end

  end

end
