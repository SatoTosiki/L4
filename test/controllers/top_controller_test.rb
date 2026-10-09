require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "logs in with a registered user" do
    User.create!(uid: "kindai", pass: BCrypt::Password.create("sanriko").to_s)

    post top_login_path, params: { uid: "kindai", pass: "sanriko" }

    assert_redirected_to top_main_path
    follow_redirect!
    assert_select "h1", "ログイン成功"
    assert_select "a[href='#{top_logout_path}']", "ログアウト"
  end

  test "shows an error for invalid credentials" do
    post top_login_path, params: { uid: "unknown", pass: "wrong" }

    assert_response :success
    assert_select "h1", "IDまたはパスワードが違います"
  end

  test "shows an error for an incorrect password" do
    User.create!(uid: "kindai", pass: BCrypt::Password.create("sanriko").to_s)

    post top_login_path, params: { uid: "kindai", pass: "wrong" }

    assert_response :success
    assert_select "h1", "IDまたはパスワードが違います"
  end

  test "logout clears the login session" do
    User.create!(uid: "kindai", pass: BCrypt::Password.create("sanriko").to_s)
    post top_login_path, params: { uid: "kindai", pass: "sanriko" }

    get top_logout_path
    assert_redirected_to top_main_path
    follow_redirect!
    assert_select "h1", "ログイン"
  end
end
