module Types
  module Interfaces
    module TimestampsInterface
      include BaseInterface

      graphql_name 'TimeStamps'

      field :created_at, Scalars::DateTimeScalar, null: false do
        description '作成日'
      end

      field :updated_at, Scalars::DateTimeScalar, null: false do
        description '更新日'
      end
    end
  end
end
