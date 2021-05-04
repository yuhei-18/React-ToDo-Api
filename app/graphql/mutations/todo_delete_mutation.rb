module Mutations
  class TodoDeleteMutation < BaseMutation
    graphql_name 'TodoDelete'
    description 'Todo 情報の削除'

    argument :id, ID, required: true

    field :deleted_todo_id, ID, null: true do
      description '削除した Todo ID'
    end

    field :todo_errors, [Types::Objects::TodoErrorObject], null: false do
      description 'ミューテーション実行中に発生した Todo エラーリスト'
    end

    def resolve(id:)
      if Todo.exists? id: id
        Todo.find(id).destroy!

        {
          deleted_todo_id: id,
          todo_errors: []
        }
      else
        {
          deleted_todo_id: nil,
          todo_errors: [
            {
              code: :invalid,
              field: %w[input id],
              message: 'その id を持つ Todo は存在しません。'
            }
          ]
        }
      end
    end
  end
end