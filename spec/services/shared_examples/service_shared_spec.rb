# frozen_string_literal: true

RSpec.shared_examples 'raises error' do
  it 'raises valid error' do
    expect { service }.to raise_error(ActiveRecord::RecordInvalid, message)
  end
end
