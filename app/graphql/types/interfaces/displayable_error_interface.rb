module Types
  module Interfaces
    module DisplayableErrorInterface
      include BaseInterface

      graphql_name 'DisplayableError'

      field :field, [String], null: true do
        description 'Path to the input field which caused the error.'
      end

      field :message, String, null: true do
        description 'The error message.'
      end
    end
  end
end
