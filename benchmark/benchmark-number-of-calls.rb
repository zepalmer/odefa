COPIES = [1, 2, 4, 8, 16, 32, 64, 128]
KS = 0..1

RULER = "==========================================="
CURRENT_DIRECTORY = File.expand_path("..", __FILE__)

require "benchmark"

KS.each do |k|
  COPIES.each do |copies|
    command_line = "ruby #{CURRENT_DIRECTORY}/generate-number-of-calls.rb #{copies} | #{CURRENT_DIRECTORY}/../swan_toploop_main.native --select-context-stack=#{k}ddpa --analyze-variables=all --disable-evaluation --disable-inconsistency-check --report-sizes"
    puts RULER
    puts "k: `#{k}'."
    puts "Copies: `#{copies}'."
    puts "Command line: `#{command_line}'."
    puts

    duration = Benchmark.measure do
      system command_line
    end

    puts
    puts "Duration: `#{duration.to_s.strip}'."
  end
end

puts RULER
