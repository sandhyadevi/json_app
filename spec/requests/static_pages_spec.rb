require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end
  
  describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:trip, user: user, trip_id: trip_id, title: title, destination: destination, start_date: start_date, end_date: end_date, destination_lat: destination_lat, destination_lng: destination_lng)
        
        sign_in user
        visit root_path
      end

     

      describe "freind/added counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.addfriend!(user)
          visit root_path
        end

        it { should have_link("0 added", href: added_user_path(user)) }
        it { should have_link("1 friendss", href: friendss_user_path(user)) }
      end
    end
  end

