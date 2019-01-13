#
# suite.rb
# Copyright © 2019 Netguru S.A. All rights reserved.
#

require "highway/compiler/analyze/analyzer"
require "highway/compiler/build/builder"
require "highway/compiler/parse/parser"

module Highway
  module Compiler

    # This class is responsible for executing all compiler stages, including
    # syntactic analysis, semantic analysis and manifest generation.
    class Suite

      public

      # Initialize an instance.
      #
      # @param registry [Highway::Steps::Registry] The registry of steps.
      # @param interface [Highway::Inteface] The interface.
      def initialize(registry:, interface:)
        @registry = registry
        @interface = interface
      end

      # Run the compiler suite.
      #
      # @param path [String] Path to the configuration file.
      # @param preset [String] Preset to compile.
      #
      # @return [Highway::Compiler::Build::Output::Manifest]
      def compile(path:, preset:)

        @interface.header_success("Compiling the configuration file...")

        parser = Parse::Parser.new(interface: @interface)
        parse_tree = parser.parse(path: path)

        analyzer = Analyze::Analyzer.new(registry: @registry, interface: @interface)
        sema_tree = analyzer.analyze(parse_tree: parse_tree)

        builder = Build::Builder.new(interface: @interface)
        manifest = builder.build(sema_tree: sema_tree, preset: preset)

        @interface.success("Successfully compiled the configuration file.")

        manifest

      end

    end

  end
end
