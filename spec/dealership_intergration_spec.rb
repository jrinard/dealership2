require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dealership list file path', {:type => :feature}) do
  it('processes the user click to return dealership list page') do
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content('Dealerships')
  end
end


describe('the add dealership form file path', {:type => :feature}) do
  it('processes the user click to return add dealership form page') do
    visit('/')
    click_link('Add New Dealership')
    expect(page).to have_content('Add dealerships:')
  end
end

describe('the add new dealership success file path', {:type => :feature}) do
  it('processes the user input and click to return success page') do
    visit('/dealerships/new')
    fill_in('name', :with => 'Cars Cars Cars')
    click_button('Add Dealership')
    expect(page).to have_content('Success')
  end
end


describe('the vehicles added to dealership page file path', {:type => :feature}) do
  it('processes the user click and returns list of vehicles') do
    visit('/dealerships')
    click_link('Cars Cars Cars')
    expect(page).to have_content('Here are all the cars in this dealership:')
  end
end

describe('adds vehicles to dealership', {:type => :feature}) do
  it('processes the user input and adds to dealership vehicle list') do
    visit('/dealerships/1/vehicles/new')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Camry')
    fill_in('year', :with => 2001)
    click_button('Add Vehicle')
    expect(page).to have_content('Success')
  end
end

describe('vehicle details path', {:type => :feature}) do
  it('opens new page for each listed vehicle within dealership') do
    visit('/dealerships/1')
    click_link('Toyota Camry 2001')
    expect(page).to have_content('Toyota')
  end
end
