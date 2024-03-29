require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a Terms & Conditions page at '/tc'" do
    get '/tc'
    response.should have_selector('title', :content => "Terms & Conditions")
  end

  it "should have a signin page at '/signin'" do
    get '/signin'
    response.should have_selector('h2', :content => "Sign in")
  end
  
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('h2', :content => "Sign up")
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About Us"
    response.should have_selector("title", :content => "About Us")

    click_link "Help"
    response.should have_selector("title", :content => "Help")

    click_link "Contact Us"
    response.should have_selector("title", :content => "Contact Us")

    click_link "Home"
    response.should have_selector("title", :content => "Home")
    
    click_link "Terms & Conditions"
    response.should have_selector("title", :content => "Terms & Conditions")

    click_link "Sign up"
    response.should have_selector("h2", :content => "Sign up")
    
    click_link "Sign in"
    response.should have_selector("h2", :content => "Sign in")
    
    click_link "logo"
    response.should have_selector("title", :content => "Home")
  end
end