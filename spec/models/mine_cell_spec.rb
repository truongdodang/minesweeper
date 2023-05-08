# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MineCell, type: :model do
  describe 'validation' do
    let!(:board) { create :board }

    context 'when has valid data' do
      let(:valid_object) { build(:mine_cell, board:) }

      it 'create a new mine cell' do
        expect { valid_object.save! }.to change { MineCell.count }.by 1
      end
    end

    context 'when has invalid data' do
      context 'when x is blank' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:mine_cell, board:, x: nil) }
          let(:message) { "Validation failed: X can't be blank, X is not a number" }
        end
      end

      context 'when y is blank' do
        it_behaves_like 'fails validation' do
          let(:invalid_object) { build(:mine_cell, board:, y: nil) }
          let(:message) { "Validation failed: Y can't be blank, Y is not a number" }
        end
      end
    end
  end
end
