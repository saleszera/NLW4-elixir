defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid. returns an user" do
      params = %{
        name: "test",
        password: "123456789",
        nickname: "teste",
        email: "test@test.com",
        age: 18
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "test", age: 18, id: ^user_id} = user
    end

    test "when all params are not valid. returns an error" do
      params = %{
        name: "test",
        nickname: "teste",
        email: "test@test.com",
        age: 0
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
