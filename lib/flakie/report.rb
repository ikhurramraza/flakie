# frozen_string_literal: true

module Flakie
  class Engine
    Report =
      Data.define(:runs) do
        def last_run = runs.last
        def empty? = runs.empty?
      end
  end
end
