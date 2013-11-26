require_relative 'phrase_counter'

phrase_counter = PhraseCounter.new

interrupted = false
trap('INT') { interrupted = true }

puts 'Press ^C to exit'

ARGF.each_line do |line|
  break if interrupted

  phrase_counter.process_line(line)

  phrase_counter.final_tally if ARGF.eof?
end

if phrase_counter.phrases.empty?
  puts 'Sorry, we couldn\'t find any content to process.'
else
  puts phrase_counter.results_table
end
