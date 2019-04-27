ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Goody.Repo, :manual)

{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, GoodyWeb.Endpoint.url())
Application.put_env(:wallaby, :chrome, binary: System.get_env("GOOGLE_CHROME_SHIM"))
