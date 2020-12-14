# frozen_string_literal: true

require 'lucid-shopify'
require 'jwt'

module Lucid
  module Shopify
    module Session
      class DecodeSessionToken
        Error = Class.new(Error)

        # @param token [String]
        #
        # @return [String] the *.myshopify.com domain of the authenticated shop
        #
        # @raise [Error]
        def call(token)
          payload, _ = JWT.decode(token, Shopify.config.shared_secret, true, algorithm: 'HS256')

          raise Error unless valid?(payload)

          myshopify_domain(payload)
        rescue JWT::DecodeError
          raise Error
        end

        # @param payload [Hash]
        #
        # @return [String]
        private def myshopify_domain(payload)
          payload['dest'].sub('https://', '')
        end

        # @param payload [Hash]
        #
        # @return [Boolean]
        private def valid?(payload)
          return false unless payload['aud'] == Shopify.config.api_key
          return false unless payload['iss'].start_with?(payload['dest'])
          return true
      end
      end
    end
  end
end
