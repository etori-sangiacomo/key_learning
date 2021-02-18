defmodule KeyLearningWeb.Api.SessionView do
  use KeyLearningWeb, :view
  alias KeyLearningWeb.Api.SessionView

  def render("error.json", %{message: message}) do
    %{status: :not_found, data: %{}, message: message}
  end

  def render("created.json", %{user: user, jwt: jwt}) do
    %{status: :ok,
      data: %{
        email: user.email,
        jwt: jwt
      },
      message: "You log in successfuly."}
  end
end
