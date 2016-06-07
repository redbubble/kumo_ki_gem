require 'spec_helper'

describe KumoKi::KMS do
  describe '#decrypt' do
    subject { KumoKi::KMS.new.decrypt("a thing")}
    let(:kms) { instance_double(Aws::KMS::Client) }

    before do
      allow(Aws::KMS::Client).to receive(:new).and_return(kms)
    end

    it 'can decrypt' do
      plaintext = 'beowulf'
      decrypted_object = double('KMS decrypted result', plaintext: plaintext)
      allow(kms).to receive(:decrypt).and_return decrypted_object

      expect(subject).to eq plaintext
    end

    context 'something goes wrong' do
      let(:nested_error_message) { 'Liar liar pants on fire' }

      it 'blows up if it cannot decrypt' do
        allow(kms).to receive(:decrypt).and_raise(RuntimeError, nested_error_message)

        expect { subject }.to raise_error(KumoKi::DecryptionError, "There was a problem decrypting your secrets: #{nested_error_message}")
      end
    end

  end
end
