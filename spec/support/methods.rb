
  def given_I_am_logged_in
    when_sign_up_with_standard_data
    when_sign_in_with_standard_data
    then_I_should_be_logged_in
  end

  def when_sign_up_with_standard_data
    visit hello.root_path
    within("form") do
      fill_in 'name',     with: 'James Pinto'
      fill_in 'email',    with: 'foo@bar.com'
      fill_in 'username', with: 'foobar'
      fill_in 'password', with: 'foobar'
    end
    click_button 'Sign Up'
  end

  def when_sign_in_with_standard_data(custom_password=nil)
    visit hello.root_path
    click_link "Sign In"
    within("form") do
      fill_in 'login',    with: 'foobar'
      fill_in 'password', with: (custom_password || 'foobar')
    end
    click_button 'Sign In'
  end

  def then_I_should_be_logged_in
    expect(page).to have_content "Hello, James Pinto!"
    expect(page).to have_content "Sign Out"
  end

  def then_I_should_not_be_logged_in
    expect(page).to have_content "Hello, Guest!"
  end




