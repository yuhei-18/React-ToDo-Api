module Queries
  class TodoQuery < Queries::BaseQuery
    type Types::Objects::TodoObject.connection_type, null: false

    argument :id,
             Int,
             required: false, default_value: nil, description: 'Todo ID'

    def resolve(id:)
      if id.nil?
        Todo.all.order(id: :desc)
      else
        Todo.where(id: id)
      end
    end
  end
end