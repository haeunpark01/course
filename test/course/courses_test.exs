defmodule Course.CoursesTest do
  use Course.DataCase

  alias Course.Courses

  describe "posts" do
    alias Course.Courses.Post

    @valid_attrs %{description: "some description", image: "some image", title: "some title"}
    @update_attrs %{description: "some updated description", image: "some updated image", title: "some updated title"}
    @invalid_attrs %{description: nil, image: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Courses.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Courses.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Courses.create_post(@valid_attrs)
      assert post.description == "some description"
      assert post.image == "some image"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Courses.update_post(post, @update_attrs)
      assert post.description == "some updated description"
      assert post.image == "some updated image"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_post(post, @invalid_attrs)
      assert post == Courses.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Courses.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Courses.change_post(post)
    end
  end
end
