require 'rails_helper'

RSpec.describe UsersController, type: :request do
  path '/users' do
    post 'Create a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: %w[name],
      }

      response '201', 'User created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
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
