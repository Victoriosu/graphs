# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Graph, type: :model do
  context 'When creating' do
    it 'Should have a name' do
      expect { Graph.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
