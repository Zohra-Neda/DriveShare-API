require 'rails_helper'

RSpec.describe ReservationsController, type: :request do

  path '/reservations' do
    get 'Get a list of reservations' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :user_id, in: :query, type: :integer

      response '200', 'List of reservations' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   start_date: { type: :string, format: 'date' },
                   end_date: { type: :string, format: 'date' },
                   city_id: { type: :integer },
                   car_id: { type: :integer },
                   user_id: { type: :integer },
                 },
                 required: %w[id start_date end_date city_id car_id user_id],
               }
        run_test!
      end
    end

    post 'Create a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :string, format: 'date' },
          end_date: { type: :string, format: 'date' },
          city_id: { type: :integer },
          car_id: { type: :integer },
          user_id: { type: :integer },
        },
        required: %w[start_date end_date city_id car_id user_id],
      }

      response '201', 'Reservation created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 start_date: { type: :string, format: 'date' },
                 end_date: { type: :string, format: 'date' },
                 city_id: { type: :integer },
                 car_id: { type: :integer },
                 user_id: { type: :integer },
               }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   properties: {
                     field_name: { type: :array, items: { type: :string } },
                   },
                   required: %w[field_name],
                 },
               }
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Get a reservation by ID' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'Reservation details' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 start_date: { type: :string, format: 'date' },
                 end_date: { type: :string, format: 'date' },
                 city_id: { type: :integer },
                 car_id: { type: :integer },
                 user_id: { type: :integer },
               }
        run_test!
      end
    end

    put 'Update a reservation by ID' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :string, format: 'date' },
          end_date: { type: :string, format: 'date' },
          city_id: { type: :integer },
          car_id: { type: :integer },
          user_id: { type: :integer },
        },
        required: %w[start_date end_date city_id car_id user_id],
      }

      response '200', 'Reservation updated' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 start_date: { type: :string, format: 'date' },
                 end_date: { type: :string, format: 'date' },
                 city_id: { type: :integer },
                 car_id: { type: :integer },
                 user_id: { type: :integer },
               }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 errors: {
                   type: :object,
                   properties: {
                     field_name: { type: :array, items: { type: :string } },
                   },
                   required: %w[field_name],
                 },
               }
        run_test!
      end
    end
  end
end
