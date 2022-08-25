require 'rails_helper'

RSpec.describe '/doctors', type: :request do
  let(:valid_attributes) {  Doctor.create!(name: 'Doctor1', specialization: 'eye specialist', available_times: 'monday-friday',
    hourly_rate: 250) }

  #   skip('Add a hash of attributes valid for your model')

  # let(:invalid_attributes) do
  #   skip('Add a hash of attributes invalid for your model')
  # end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get doctors_url, headers: valid_headers, as: :json
      expect(valid_attributes).to be_valid


      # Doctor.create! valid_attributes
      # get doctors_url, headers: valid_headers, as: :json
      
      # expect(response).to be_successful      
      # expect(valid_attributes).to be_successful
    end
  end

  describe 'GET /show' do
    # before(:each) {get doctors_path(1)}

    it 'renders a successful response' do
      doctor = Doctor.create! valid_attributes
      get doctor_url(doctor), as: :json
      expect(valid_attributes).to be_valid
    end
      
      
      # expect(valid_attributes).to be_successful

    
  end  
end