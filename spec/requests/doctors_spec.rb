require 'rails_helper'

describe 'Doctors API', type: :request do
  # before :each do
  #   post '/users', params: {
  #         # post '/authenticate', params: {
  #     user: {
  #       username: 'John Doe',
  #       password_digest: 'Password1',
  #       role: 'regular'
  #     }
  #   }.to_json, headers: {
  #     'Content-Type': 'application/json',
  #     Accept: 'application/json'
  #   }
  # end

  it 'returns all doctors' do
    FactoryBot.create(:doctor, name: 'Nandita', specialization: 'eye specialist', available_times: 'monday-friday',
                               hourly_rate: 250)
    FactoryBot.create(:doctor, name: 'Sarchand', specialization: 'eye specialist', available_times: 'monday-friday',
                               hourly_rate: 260)

    get '/doctors'

    expect(response).to have_http_status(:success)
    expect(response).to have_http_status(200)
    expect(response.status).to eq(200)

    expect(JSON.parse(response.body).size).to eq(2)
    expect(JSON.parse(response.body).size).to eq(Doctor.count)
  end

  context 'POST/doctors' do
    it 'should create a new doctor' do
      expect do
        post '/doctors',
             params: { doctor: { name: 'Nandita', specialization: 'eye specialist', available_times: 'monday-friday',
                                 hourly_rate: 250 } }
      end.to change(Doctor, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end
end

describe 'DELETE #destroy' do
  it 'destroys the requested doctor' do
    doctor = FactoryBot.create(:doctor)
    expect do
      delete :destroy, params: { id: doctor.id }
    end
  end
end
