# frozen_string_literal: true

require 'bigdecimal'

%w[
  version
  meeting
].each do |filename|
  require File.expand_path("../meeting-scheduler/#{filename}", Pathname.new(__FILE__).realpath)
end


module MeetingScheduler
  class Error < StandardError; end
  # Your code goes here...
end
