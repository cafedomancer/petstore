require 'rails_helper'

RSpec.describe '/users', type: :request do
  include Committee::Rails::Test::Methods

  describe 'POST /users' do
    context 'when valid' do
      it 'creates a user' do
        post users_url, params: {
          username: 'johndoe',
          password: 'p@ssw0rd',
          first_name: 'John',
          last_name: 'Doe',
          email: 'john.doe@example.com',
          phone: '03-1234-5678',
        }, as: :json

        assert_request_schema_confirm
        assert_response_schema_confirm(201)
      end
    end

    context 'when invalid' do
      before do
        create(:user, {
          username: 'johndoe',
          password: 'p@ssw0rd',
          first_name: 'John',
          last_name: 'Doe',
          email: 'john.doe@example.com',
          phone: '03-1234-5678',
        })
      end

      it 'does not create a user' do
        post users_url, params: {
          username: 'johndoe',
          password: '',
          first_name: '',
          last_name: '',
          email: 'john.doe@example.com',
          phone: '',
        }, as: :json

        assert_request_schema_confirm
        assert_response_schema_confirm(422)
      end
    end
  end
end
