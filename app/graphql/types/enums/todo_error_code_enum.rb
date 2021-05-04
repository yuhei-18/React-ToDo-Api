module Types
  module Enums
    class TodoErrorCodeEnum < BaseEnum
      graphql_name 'TodoErrorCode'

      value 'BLANK', 'インプットが入力されていません。'
      value 'INVALID', 'インプットが無効です。'
      value 'NOT_FOUND', 'id と一致する抽選結果が見つかりませんでした。'
    end
  end
end