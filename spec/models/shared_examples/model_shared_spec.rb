# frozen_string_literal: true

RSpec.shared_examples 'fails validation' do
  it 'raises RecordInvalid error' do
    expect { invalid_object.save! }.to raise_error(ActiveRecord::RecordInvalid, message)
  end
end
