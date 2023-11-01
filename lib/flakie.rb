# frozen_string_literal: true

autoload(:Zeitwerk, "zeitwerk")
autoload(:OptionParser, "optparse")

Zeitwerk::Loader.for_gem.tap do |loader|
  loader.inflector.inflect("cli" => "CLI")
  loader.setup
end

module Flakie
end
