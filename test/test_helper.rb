gem "minitest"

require "minitest/autorun"
require "minitest/reporters"
require "pry-byebug"

require './lib/word_checker'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new({ color: true })]
