# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoardCreator, type: :service do
  describe '#call' do
    subject(:service) { BoardCreator.new(options).call }

    let(:creator_email) { 'truong@example.com' }
    let(:name) { 'Board 1' }
    let(:width) { 20 }
    let(:height) { 10 }
    let(:mines_num) { 50 }

    let(:options) { { creator_email:, name:, width:, height:, mines_num: } }

    context 'when has valid data' do
      before { service }

      it 'creates a new board' do
        expect(Board.count).to eq 1
      end

      it 'has correct attributes' do
        expect(Board.last).to have_attributes(creator_email:, name:, width:, height:, mines_num:)
      end
    end

    context 'when has invalid data' do
      context 'when creator email is blank' do
        let(:creator_email) { '' }

        it_behaves_like 'raises error' do
          let(:message) { "Validation failed: Creator email can't be blank, Creator email is invalid" }
        end
      end

      context 'when board name is blank' do
        let(:name) { '' }

        it_behaves_like 'raises error' do
          let(:message) { "Validation failed: Name can't be blank" }
        end
      end

      context 'when board width = 0' do
        let(:width) { 0 }

        it_behaves_like 'raises error' do
          let(:message) { 'Validation failed: Width must be greater than 0' }
        end
      end

      context 'when board height = 0' do
        let(:height) { 0 }

        it_behaves_like 'raises error' do
          let(:message) { 'Validation failed: Height must be greater than 0' }
        end
      end

      context 'when mines number = 0' do
        let(:mines_num) { 0 }

        it_behaves_like 'raises error' do
          let(:message) { 'Validation failed: Mines num must be greater than 0' }
        end
      end
    end
  end
end
