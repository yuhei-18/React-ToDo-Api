module Types
  module Interfaces
    module BaseInterface
      include GraphQL::Schema::Interface
      field_class Types::Fields::BaseField
    end
  end
end
