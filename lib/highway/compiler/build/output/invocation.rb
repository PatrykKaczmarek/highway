#
# invocation.rb
# Copyright © 2019 Netguru S.A. All rights reserved.
#

module Highway
  module Compiler
    module Build
      module Output

        # This class represents a step invocation in the build manifest. It
        # contains information about step definition class, parameters and
        # execution policy.
        class Invocation

          public

          # Initialize an instance.
          #
          # @param index [Integer] Index of invocation, 1-based.
          # @param step_class [Class] Definition class of the step.
          # @param parameters [Highway::Compiler::Analyze::Tree::Values::Hash] Hash value of step parameters.
          # @param policy [Symbol] Execution policy of the step invocation.
          # @param keypath [Array<String>] A keypath used for debugging purposes.
          def initialize(index:, step_class:, parameters:, policy:, keypath:)
            @index = index
            @step_class = step_class
            @parameters = parameters
            @policy = policy
            @keypath = keypath
          end

          # Index of invocation, 1-based.
          #
          # @return [Integer]
          attr_reader :index

          # Definition class of the step.
          #
          # @return [Class]
          attr_reader :step_class

          # Hash value of step parameters.
          #
          # @return [Highway::Compiler::Analyze::Tree::Values::Hash]
          attr_reader :parameters

          # Execution policy of the step invocation.
          #
          # @return [Symbol]
          attr_reader :policy

          # A keypath used for debugging purposes.
          #
          # @return [Array<String>]
          attr_reader :keypath

          # An identifier of the invocation, joined by index and step name.
          #
          # @return [String]
          def identifier
            return "#{index}-#{step_class.name}"
          end

        end

      end
    end
  end
end
