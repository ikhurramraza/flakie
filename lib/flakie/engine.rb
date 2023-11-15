# frozen_string_literal: true

module Flakie
  class Engine
    def initialize(command, count:, reporter:)
      @command = command
      @count = count
      @reporter = reporter
      @report = Report.new([])
    end

    def run
      reporter.open

      count.times do |index|
        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        system(command, out: File::NULL, err: File::NULL)
        end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        duration = (end_time - start_time).round
        report.runs.append Run.new(status: $?.success?, duration: duration, number: index + 1)
        reporter.report(report)
      end

      reporter.close
    end

    private

    attr_reader :command, :count, :reporter, :report
  end
end
