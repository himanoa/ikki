# frozen_string_literal: true

class CommandJob < ApplicationJob
  queue_as :default

  def perform(command:, args: [])
    system("#{command} #{args.join(' ')}")
  end
end
