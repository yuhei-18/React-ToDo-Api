module Types
  class MutationType < Types::Objects::BaseObject

    field :todo_create, mutation: Mutations::TodoCreateMutation
  end
end
