# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MineCellsCreator, type: :service do
  describe '#call' do
    subject(:service) { MineCellsCreator.new(board:).call }

    context 'when has valid data' do
      let(:board) { create(:board) }

      it 'creates right mine cells' do
        service
        expect(board.mine_cells.count).to eq board.mines_num
      end
    end

    context 'when has invalid data' do
      let(:board) { nil }

      it 'raises error' do
        expect { service }.to raise_error(RuntimeError, 'Could not create mine cells without board info.')
      end
    end
  end
end
