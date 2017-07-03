$LOAD_PATH.unshift(File.dirname(__FILE__))

# TODO: replace with something localized
# 1. Just pass in when starting the web server SLACK_API_TOKEN=*** bundle exec puma -p $port
# require 'dotenv'
# Dotenv.load

require 'slack_library_bot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackLibraryBot::Server.new
    SlackLibraryBot::Bot.run
  rescue StandardError => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackLibraryBot::Web