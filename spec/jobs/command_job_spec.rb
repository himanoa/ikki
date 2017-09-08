# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommandJob, type: :job do
  describe '#ping' do
    it 'enque command job' do
      assert_enqueued_with(job: CommandJob, args: [{ command: 'ls' }]) { CommandJob.set.perform_later command: 'ls' }
    end
  end
end
