module Types
  class QueryType < Types::Objects::BaseObject

    field :todo, resolver: Queries::TodoQuery do
      description 'Todo 情報の取得'
    end
  end
end
