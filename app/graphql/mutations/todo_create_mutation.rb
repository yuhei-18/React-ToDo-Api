module Mutations
  class TodoCreateMutation < BaseMutation
    graphql_name 'TodoCreate'
    description 'Todo 情報の作成'

    argument :title, String, required: true

    argument :content, String, required: true

    argument :priority, Integer,  required: false

    argument :due_date, Types::Scalars::DateTimeScalar,  required: false

    argument :is_done, Boolean, required: false

    field :todo, Types::Objects::TodoObject, null: true do
      description 'Todo 情報'
    end

    def resolve(title:, content:, priority: nil, due_date: nil, is_done: false)
      todo = Todo.create!(title: title, content: content, priority: priority, due_date: due_date, is_done: is_done)

      { todo: todo, errors: [] }
    end
  end
end
