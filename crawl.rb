require 'trollop'

dir = "#{File.expand_path(File.dirname(__FILE__))}"
Dir["#{dir}/ap/*.rb"].each {|f| require f }
Dir["#{dir}/posthook/*.rb"].each {|f| require f }

params = Trollop::options do
  opt :states, "Comma-separated states to download", :type => :string, :default => nil
  opt :skipstates, "Comma-separated states not to download", :default => ''
  opt :initialize, "Create initial set of results records", :default => false
  opt :once, "Only download and import data once", :default => false
  opt :clean, "Clean the data directories for specified states before downloading", :default => false
  opt :interval, "Interval (in seconds) at which AP data will be downloaded", :type => :int, :default => nil
  opt :record, "Record this run", :default => false
  opt :replay, "Replay the most recent run", :default => false
  opt :replaydate, "Specify date of replay to run (e.g. 20120521)", :type => :string
end

AP::Crawler.new(dir, params).crawl
