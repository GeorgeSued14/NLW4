defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Number

  def index(conn, %{"filename" => filename}) do
    filename
    |> Number.sum_from_file()
    |> handler_response(conn)
  end

  defp handler_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here is your number #{result}"})
  end

  defp handler_response({:error, _reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(_reason)
  end
end
