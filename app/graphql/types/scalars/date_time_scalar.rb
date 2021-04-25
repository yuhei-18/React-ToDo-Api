module Types
  module Scalars
    class DateTimeScalar < GraphQL::Types::ISO8601DateTime
      graphql_name 'DateTime'
    end
  end
end
