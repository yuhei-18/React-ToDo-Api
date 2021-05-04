module Types
  class MutationType < Types::Objects::BaseObject

    field :todo_create, mutation: Mutations::TodoCreateMutation
    field :todo_update, mutation: Mutations::TodoUpdateMutation
    field :todo_delete, mutation: Mutations::TodoDeleteMutation
  end
end
