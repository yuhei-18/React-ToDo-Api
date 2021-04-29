module Types
  module Objects
    class TodoObject < Types::Objects::BaseObject
      implements Interfaces::TimestampsInterface

      graphql_name 'Todo'
      description 'Todo情報'

      field :id, ID, null: false do
        description 'Todo ID'
      end

      field :title, String, null: false do
        description 'タイトル'
      end

      field :content, String, null: false do
        description 'コンテンツ'
      end

      field :priority, Integer, null: true do
        description '優先度'
      end

      field :due_date, Scalars::DateTimeScalar, null: true do
        description '期限'
      end

      field :is_done, Boolean, null: false do
        description '対応済みフラグ'
      end
    end
  end
end