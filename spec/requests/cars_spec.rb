require 'rails_helper'

RSpec.describe CarsController, type: :request do
  path '/cars' do
    get 'Get a list of cars' do
      tags 'Cars'
      produces 'application/json'

      response '200', 'List of cars' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   image: { type: :string },
                   description: { type: :string },
                   available: { type: :boolean },
                   city_id: { type: :integer },
                   user_id: { type: :integer },
                   price: { type: :number },
                   model: { type: :string },
                 },
                 required: %w[id name image description available city_id user_id price model],
               }
        run_test!
      end
    end

    post 'Create a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          description: { type: :string },
          available: { type: :boolean },
          city_id: { type: :integer },
          user_id: { type: :integer },
          price: { type: :number },
          model: { type: :string },
        },
        required: %w[name image description available city_id user_id price model],
      }

      response '201', 'Car created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 image: { type: :string },
                 description: { type: :string },
                 available: { type: :boolean },
                 city_id: { type: :integer },
                 user_id: { type: :integer },
                 price: { type: :number },
                 model: { type: :string },
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

  path '/cars/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Get a car by ID' do
      tags 'Cars'
      produces 'application/json'

      response '200', 'Car details' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 image: { type: :string },
                 description: { type: :string },
                 available: { type: :boolean },
                 city_id: { type: :integer },
                 user_id: { type: :integer },
                 price: { type: :number },
                 model: { type: :string },
               }
        run_test!
      end
    end

    put 'Update a car by ID' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          description: { type: :string },
          available: { type: :boolean },
          city_id: { type: :integer },
          user_id: { type: :integer },
          price: { type: :number },
          model: { type: :string },
        },
        required: %w[name image description available city_id user_id price model],
      }

      response '200', 'Car updated' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 image: { type: :string },
                 description: { type: :string },
                 available: { type: :boolean },
                 city_id: { type: :integer },
                 user_id: { type: :integer },
                 price: { type: :number },
                 model: { type: :string },
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
