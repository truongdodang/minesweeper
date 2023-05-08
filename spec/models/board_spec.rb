# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'validation' do
    context 'when has valid data' do
      let(:valid_object) { build :board }

      it 'creates a new board' do
        expect { valid_object.save! }.to change { Board.count }.by 1
      end
    end

    context 'when has invalid data' do
      context 'when creator email is blank' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:board, creator_email: nil) }
          let(:message) { "Validation failed: Creator email can't be blank, Creator email is invalid" }
        end
      end

      context 'when name is blank' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:board, name: nil) }
          let(:message) { "Validation failed: Name can't be blank" }
        end
      end

      context 'when width eq 0' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:board, width: 0) }
          let(:message) { 'Validation failed: Width must be greater than 0' }
        end
      end

      context 'when height eq 0' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:board, height: 0) }
          let(:message) { 'Validation failed: Height must be greater than 0' }
        end
      end

      context 'when mines_num eq 0' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:board, mines_num: 0) }
          let(:message) { 'Validation failed: Mines num must be greater than 0' }
        end
      end
    end
  end
end
