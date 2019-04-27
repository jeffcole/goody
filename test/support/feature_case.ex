defmodule GoodyWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Goody.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import GoodyWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Goody.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Goody.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Goody.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
