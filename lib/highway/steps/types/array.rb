#
# array.rb
# Copyright © 2018 Netguru S.A. All rights reserved.
#

module Highway
  module Steps
    module Types

      # This class represents an array parameter type.
      class Array

        public

        # Initialize an instance.
        #
        # @param element_type [Object] Type of inner elements.
        def initialize(element_type:)
          @element_type = element_type
        end

        # Validate a value after conercing it if possible.
        #
        # This method returns a valid and coerced value or `nil` if value is
        # invalid or can't be coerced.
        #
        # @param value [Object] A value.
        #
        # @return [Array<Object>, NilClass]
        def coerce_and_validate(value:)
          return nil unless value.is_a?(::Array)
          coerced = value.map { |element| element.coerce_and_validate(value: element) }
          coerced if coerced.all? { |element| !element.nil? }
        end

      end

    end
  end
end
