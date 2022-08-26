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
    # expect(JSON.parse(response.body).size).to eq(Doctor.count)
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

describe 'POST /doctors' do
  it 'cereate a new doctor' do
    expect do
      post '/doctors',
           params: { doctor: { name: 'Doc1', specialization: 'Head', available_times: 'wednesday', hourly_rate: 300 } }
    end.to change { Doctor.count }.from(0).to(1)

    expect(response).to have_http_status(:created)
  end
end

describe 'DELETE /doctors/:id' do
  let!(:doctor) do
    FactoryBot.create(:doctor, name: 'Nandita', specialization: 'eye specialist', available_times: 'monday-friday',
                               hourly_rate: 250)
  end

  it 'delete a doctor' do
    expect do
      delete "/doctors/#{doctor.id}"
    end.to change { Doctor.count }.from(1).to(0)

    expect(response).to have_http_status(:no_content)
  end
end
