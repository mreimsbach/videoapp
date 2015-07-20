require 'rails_helper'

feature 'Admin functions' do
    scenario 'deletes other users at index view' do
      user = create(:user)
      sign_in create(:user)
      get users_admin_index_path
      expect(page).to have_content("loooool")
      expect(page).to have_content('delete')
    end
end
