#
# context_mock.rb
# Copyright © 2019 Netguru S.A. All rights reserved.
#

require "highway"
require "spec/helpers/interface_mock"
require "spec/helpers/environment_mock"

module HighwaySpec
    module Helpers
        class ContextMock < Highway::Runtime::Context

            attr_accessor :run_action_name
            attr_accessor :run_action_options

            attr_accessor :fastlane_lane_context

            def initialize()
            end

            def run_action(name, options:)
                @run_action_name = name
                @run_action_options = options
            end

            def assert_gem_available!(name)
            end
        end
    end
end