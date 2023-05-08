# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AllCellsGenerator, type: :service do
  subject(:service) { AllCellsGenerator.new(board:).call }

  describe '#call' do
    context 'when has valid data' do
      let(:board) { create(:board) }

      it 'creates all cells' do
        expect(service.size).to eq board.width * board.height
      end
    end

    context 'when has invalid data' do
      let(:board) { nil }

      it 'raises error' do
        expect { service }.to raise_error(RuntimeError, 'Could not generate all cells without board info.')
      end
    end
  end
end
