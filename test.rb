require 'ruby-prof'

# Profile the code
puts 'Starting request...'
RubyProf.start
app.get '/460k'
result = RubyProf.stop
puts 'Request done.'
# Print a flat profile to text
File.open "#{RAILS_ROOT}/tmp/profile-graph.html", 'w' do |file|
  RubyProf::GraphHtmlPrinter.new(result).print(file)
end
puts 'Done.'

