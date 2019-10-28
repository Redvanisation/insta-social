# frozen_string_literal: true

require 'rails_helper'

def create_post(post)
  visit new_post_path
  fill_in 'Content', with: post.content
  click_button 'Publish'
end

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe PostsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
