# frozen_string_literal: true

module FixturesTestHelper
  extend self

  def get(name)
    File.read(File.join(__dir__, "..", "fixtures", name))
  end
end
