module Types
  module Enums
    class TodoErrorCodeEnum < BaseEnum
      graphql_name 'TodoErrorCode'

      value 'BLANK', value: :blank, description: 'インプットが入力されていません。'
      value 'INVALID', value: :invalid, description: 'インプットが無効です。'
      value 'NOT_FOUND', value: :not_found, description: 'id と一致する抽選結果が見つかりませんでした。'
    end
  end
end