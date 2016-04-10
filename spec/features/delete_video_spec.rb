require 'rails_helper'

describe 'deleting a video' do
 it 'can delete a video' do
   visit '/'
   within 'center' do
     click_link 'Add Video'
   end
   fill_in 'video_title', with: 'dog'
   page.attach_file('video_file', Rails.root + 'spec/fixtures/mov_bbb.mp4')
   click_button 'Create Video'
   expect(page).to have_content 'dog'
   click_link 'Delete'
   expect(page).to have_content 'Video Deleted!'
 end
end
