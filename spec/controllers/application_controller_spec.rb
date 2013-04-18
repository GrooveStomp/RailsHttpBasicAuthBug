require 'spec_helper'

describe ApplicationController do

  describe '#home' do

    context 'with OAuth Bearer HTTP_AUTHORIZATION' do
      before { request.env['HTTP_AUTHORIZATION'] = 'Bearer 1234567890' }

      it 'should not use HTTP Basic authentication' do
        controller.should_not_receive(:authenticate_with_http_basic)
        get :home
      end
    end

    context 'with OAuth Basic HTTP_AUTHORIZATION' do
      before { request.env['HTTP_AUTHORIZATION'] = 'Basic R3Jvb3ZlU3RvbXA6R3Jvb3ZlU3RvbXA=' }

      it 'should use HTTP Basic authentication' do
        controller.should_receive(:authenticate_with_http_basic)
        get :home
      end
    end

  end

end
