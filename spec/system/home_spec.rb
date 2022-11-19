require 'rails_helper'

RSpec.describe 'Home', type: :system do
  before do # ここから追記
    driven_by :selenium_chrome_headless
  end # ここまで追記
  before do
    driven_by(:rack_test)
  end

  describe 'トップページの検証' do
    it 'Home#top という文字列が表示される' do
      visit '/'

      expect(page).to have_content('Home#top')
    end
  end
end

#require 'rails_helper'

#RSpec.describe "Homes", type: :system do
 # before do
  #  driven_by(:rack_test)
  #end

  #pending "add some scenarios (or delete) #{__FILE__}"
#end
