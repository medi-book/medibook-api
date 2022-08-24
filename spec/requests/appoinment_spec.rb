require 'rails_helper'

RSpec.describe '/appointments', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Appointment.create! valid_attributes
      get appointments_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      appointment = Appointment.create! valid_attributes
      get appointment_url(appointment), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Appointment' do
        expect do
          post appointments_url,
               params: { appointment: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Appointment, :count).by(1)
      end

      it 'renders a JSON response with the new appointment' do
        post appointments_url,
             params: { appointment: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Appointment' do
        expect do
          post appointments_url,
               params: { appointment: invalid_attributes }, as: :json
        end.to change(Appointment, :count).by(0)
      end

      it 'renders a JSON response with errors for the new appointment' do
        post appointments_url,
             params: { appointment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested appointment' do
        appointment = Appointment.create! valid_attributes
        patch appointment_url(appointment),
              params: { appointment: new_attributes }, headers: valid_headers, as: :json
        appointment.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the appointment' do
        appointment = Appointment.create! valid_attributes
        patch appointment_url(appointment),
              params: { appointment: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the appointment' do
        appointment = Appointment.create! valid_attributes
        patch appointment_url(appointment),
              params: { appointment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested appointment' do
      appointment = Appointment.create! valid_attributes
      expect do
        delete appointment_url(appointment), headers: valid_headers, as: :json
      end.to change(Appointment, :count).by(-1)
    end
  end
end