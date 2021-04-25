module Types
  class BaseField < GraphQL::Schema::Field
    argument_class Types::Arguments::BaseArgument
  end
end
