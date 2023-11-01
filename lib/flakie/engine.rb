# frozen_string_literal: true

module Flakie
  class Engine
    Run =
      Data.define(:status, :duration, :number) do
        def success? = status == true
        def failure? = status == true
      end

    Report = Data.define(:runs) { def last_run = runs.last }

    def initialize(command, count:, env:, reporter:)
      @command = command
      @count = count
      @env = env
      @reporter = reporter
      @report = Report.new([])
    end

    def run
      reporter.open

      count.times do |index|
        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        system(env, command, out: File::NULL, err: File::NULL)
        end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        duration = (end_time - start_time).round
        report.runs.append Run.new(status: $?.success?, duration: duration, number: index + 1)
        reporter.report(report)
      end

      reporter.close
    end

    private

    attr_reader :command, :count, :env, :reporter, :report
  end
end
