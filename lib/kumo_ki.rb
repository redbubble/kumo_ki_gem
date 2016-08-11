require 'kumo_ki/version'
require 'kumo_ki/errors'
require 'aws-sdk'
require 'base64'

module KumoKi
  class KMS
    def client
      @client ||= Aws::KMS::Client.new(
        region: ENV['AWS_REGION'] || 'us-east-1',
      )
    end

    def decrypt(cipher_text)
      client.decrypt({
        ciphertext_blob: Base64.decode64(cipher_text)
      }).plaintext
    rescue Aws::Errors::MissingCredentialsError => e
      raise KumoKi::KumoKiError.new("No AWS credentials found.  Try setting AWS_SECRET_ACCESS_KEY and AWS_ACCESS_KEY_ID environment variables")
    rescue => e
      raise KumoKi::DecryptionError.new("There was a problem decrypting your secrets: #{e.message}")
    end

    def encrypt_for(env_name, plain_text)
      Base64.encode64(client.encrypt({
        key_id:    key_for_environment(env_name),
        plaintext: plain_text,
      }).ciphertext_blob)
    end

    private

    def key_for_environment(env_name)
      key_name = env_name == 'production' ? 'production' : 'non-production'
      "alias/kumo-#{key_name}"
    end
  end
end
