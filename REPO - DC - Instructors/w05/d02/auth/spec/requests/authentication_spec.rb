require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_button('signin') }
  end

  describe "signin process" do
    before { visit signin_path }

    context "with invalid information" do
      before { click_button 'signin' }

      it { should have_button('signin') }
      it { should have_selector('p.error') }
    end

    context "with valid information" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in 'Email', with: user.email.upcase
        fill_in 'Password', with: user.password
        click_button 'signin'
      end

      it { should have_link(user.name, user_path(user)) }
      it { should have_button('signout') }

      describe "followed by signout" do
        before { click_button 'signout' }
        #it { should have_button('signin') }
      end
    end
  end

  describe "authorization for non-authenticated users" do
    let(:user) { FactoryGirl.create(:user) }

    context "users_controller" do
      describe "#edit" do
        before { get edit_user_path(user) }
        it { should redirect_to(signin_path) }
      end

      describe "#update" do
        before { patch user_path(user) }
        it { should redirect_to(signin_path) }
      end

      describe "#destroy" do
        before { delete user_path(user) }
        it { should redirect_to(signin_path) }
      end
    end

    describe "when attempting to visit a protected page" do
      before do
        visit edit_user_path(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button 'signin'
      end

      it "should render the desired page after signin" do
        expect(current_path).to eq(edit_user_path(user))
      end
    end
  end

  describe "authorization as wrong user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
    
    before do
      visit signin_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button 'signin'
    end

    context "users_controller" do
      describe "#edit" do
        before { get edit_user_path(wrong_user) }
        it { should redirect_to(signin_path) }
      end

      describe "#update" do
        before { patch user_path(wrong_user) }
        it { should redirect_to(signin_path) }
      end

      describe "#destroy" do
        before { delete user_path(wrong_user) }
        it { should redirect_to(signin_path) }
      end
    end
  end
end