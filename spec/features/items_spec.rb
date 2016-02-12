require 'rails_helper'

# Change JS: to true after Firefox is installed & testing JS
RSpec.feature "Items", type: :feature, js: false do
  before do
    item = Item.create(title: "item_test", price: 10.00, description: "cool stuff", quantity: 4, user_id: 2)
    category = Category.create(name: "category_test")
    admin = User.create(username: "BobRoss", email: "bob@tree.com", password: "paint", admin: true)
    non_admin = User.create(username: "Shakira", email: "hips@lady.com", password: "song", admin: false)
  end

  it 'can see the page title' do
    visit('/items')
    expect(page).to have_content("Atelier Nouveau")
  end

end

