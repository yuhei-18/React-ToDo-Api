module Types
  module Objects
    class TodoErrorObject < BaseObject
      implements Interfaces::DisplayableErrorInterface

      graphql_name 'TodoError'
      description 'Todo ミューテーション実行時に発生するエラー。'

      field :code, Enums::TodoErrorCodeEnum, null: false do
        description 'エラーを一意に識別するためのエラーコード'
      end
    end
  end
end
