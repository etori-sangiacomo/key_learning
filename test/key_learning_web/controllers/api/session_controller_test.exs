defmodule KeyLearningWeb.Api.SessionControllerTest do
  use KeyLearningWeb.ConnCase

  test "error: send email nil", %{conn: conn} do
    conn = post(conn, Routes.api_session_path(conn, :create), %{"email" => nil})
    assert json_response(conn, 401) == %{
      "data" => %{},
      "message" => "You could not be authenticated.",
      "status" => "not_found"
    }
  end

  test "error: send email valid but wrong password", %{conn: conn} do
    user = KeyLearning.AccountsFixtures.user_fixture()

    conn =
      post(conn, Routes.api_session_path(conn, :create), %{
        "email" => user.email,
        "password" => "any wrong password"
      })

    assert json_response(conn, 401) == %{
      "data" => %{},
      "message" => "You could not be authenticated.",
      "status" => "not_found"
    }
  end

  test "ok: send email and password valid", %{conn: conn} do
    user = KeyLearning.AccountsFixtures.user_fixture()

    conn =
      post(conn, Routes.api_session_path(conn, :create), %{
        "email" => user.email,
        "password" => KeyLearning.AccountsFixtures.valid_user_password()
      })

    assert json_response(conn, 200)["data"]["email"] == user.email
    assert json_response(conn, 200)["message"] == "You log in successfuly."
  end
end
