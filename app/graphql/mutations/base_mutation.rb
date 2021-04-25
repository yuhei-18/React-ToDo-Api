module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::Arguments::BaseArgument
    field_class Types::Fields::BaseField
    input_object_class Types::Inputs::BaseInputObject
    object_class Types::Objects::BaseObject
  end
end
