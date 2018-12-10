#
# manifest.rb
# Copyright © 2018 Netguru S.A. All rights reserved.
#

require "highway/compiler/build/output/invocation"

module Highway
  module Compiler
    module Build
      module Output

        # This class represents a build manifest. It contains compiled step
        # invocations.
        class Manifest

          public

          # Initialize an instance.
          def initialize()
            @invocations = Array.new()
          end

          # @return [String] The preset.
          attr_accessor :preset

          # @return [Array<Highway::Compiler::Build::Output::Invocation>] Invocations in the manifest.
          attr_reader :invocations

          # Add an invocation to the manifest.
          #
          # @param step_class [Class] Definition class of the step.
          # @param parameters [Array<Highway::Compiler::Analyze::Tree::Parameter>] Parameters of the step invocation.
          # @param policy [:normal, :always] Execution policy of the step invocation.
          def add_invocation(step_class:, parameters:, policy:)
            @invocations << Invocation.new(step_class: step_class, parameters: parameters, policy: policy)
          end

        end

      end
    end
  end
end
