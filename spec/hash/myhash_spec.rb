# frozen_string_literal: true

require_relative '../../hash/myhash'

RSpec.describe MyHash do
  subject { MyHash.new }

  describe '[]=' do
    let(:key) { :first_key }
    let(:value) { 123 }

    it do
      expect { subject[key] = value }.to change { subject[key] }
        .from(nil)
        .to(value)
    end
  end

  describe '[]' do
    let(:first_key) { :first_key }
    let(:second_key) { :second_key }
    let(:unknown_key) { :unknown_key }
    let(:first_value) { 123 }
    let(:second_value) { 321 }

    before do
      subject[first_key] = first_value
      subject[second_key] = second_value
    end

    it { expect(subject[first_key]).to eq first_value }
    it { expect(subject[second_key]).to eq second_value }
    it { expect(subject[unknown_key]).to be_nil }
  end
end
