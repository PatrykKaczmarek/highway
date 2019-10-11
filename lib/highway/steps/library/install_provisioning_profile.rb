#
# install_provisioning_profile.rb
# Copyright © 2019 Netguru S.A. All rights reserved.
#

require "highway/steps/infrastructure"

module Highway
    module Steps
      module Library
  
        class InstallProvisioningProfileStep < Step
  
          def self.name
            "install_provisioning_profile"
          end
  
          def self.parameters
            [
              Parameters::Single.new(
                name: "path",
                type: Types::AnyOf.new(
                  single: Types::String.regex(/^\/([-\w_+]+\/)*([\w\s()]+\.mobileprovision)$/),
                  array: Types::String.regex(/^(.+?)\/([\w\s()]+\.mobileprovision)$/),
                ),
                required: true,
              ),
              Parameters::Single.new(
                name: "delimiter",
                required: false,
                type: Types::String.new(),
              )
            ]
          end
  
          def self.run(parameters:, context:, report:)
  
            path_key = parameters["path"][:tag]
            path_value = parameters["path"][:value]
            delimiter = parameters["delimiter"]

            if path_key == :single 
              context.run_action("install_provisioning_profile", options: {
                path: path_value
              })
            else
              unless delimiter != nil && !delimiter.empty?
                context.interface.fatal!("Detected multiple provisioning profiles paths. You must provide delimiter character to split paths.")
              end
              path_value.split(delimiter).each do |path|
                context.run_action("install_provisioning_profile", options: {
                  path: path.strip
                })
              end
            end

          end
  
        end
  
      end
    end
  end