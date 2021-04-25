module Types
  module Inputs
    class BaseInputObject < GraphQL::Schema::InputObject
      argument_class Types::Arguments::BaseArgument
    end
  end
end
