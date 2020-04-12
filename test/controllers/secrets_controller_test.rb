# frozen_string_literal: true

require 'test_helper'

class SecretsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @secret = secrets(:one)
  end

  test 'should get index' do
    get secrets_url
    assert_response :success
  end

  test 'should get new' do
    get new_secret_url
    assert_response :success
  end

  test 'should create secret' do
    assert_difference('Secret.count') do
      post secrets_url, params: { secret: { domain: @secret.domain, name: @secret.name, value: @secret.value } }
    end

    assert_redirected_to secret_url(Secret.last)
  end

  test 'should show secret' do
    get secret_url(@secret)
    assert_response :success
  end

  test 'should get edit' do
    get edit_secret_url(@secret)
    assert_response :success
  end

  test 'should update secret' do
    patch secret_url(@secret), params: { secret: { domain: @secret.domain, name: @secret.name, value: @secret.value } }
    assert_redirected_to secret_url(@secret)
  end

  test 'should destroy secret' do
    assert_difference('Secret.count', -1) do
      delete secret_url(@secret)
    end

    assert_redirected_to secrets_url
  end
end
