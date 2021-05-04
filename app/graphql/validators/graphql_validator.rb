
module Validators
  module GraphqlValidator
    # 入力された値が存在するか
    # @param input_name [String] エラー内容として出力したい文字列
    # @param value [String] チェックしたい値
    # @return [Hash] 値が空だった場合、code field message のhashが返却される
    def validate_input_presence(input_name, value)
      return if value.present?

      {
        code: :blank,
        field: %W[input #{input_name}],
        message: "#{input_name} が入力されていません。"
      }
    end

    # 入力された数値が 1 以上か
    # @param input_name [String] エラー内容として出力したい文字列
    # @param num [Int] チェックしたい数値
    # @return [Hash] 数値が 1 未満の場合、code field message のhashが返却される
    def validate_greater_than_one(input_name, num)
      return if num >= 1

      {
        code: :invalid,
        field: %W[input #{input_name}],
        message: "1 以上の数値を入力してください。"
      }
    end

    # レコードが存在するか
    # @param model_name [String] エラー内容として出力したい文字列
    # @param value [Object] チェックしたい値
    # @return [Hash] 値が空だった場合、code field message のhashが返却される
    def validate_record_presence(model_name, value)
      return if value.present?

      {
        code: :record_not_found,
        field: %W[#{model_name}],
        message: "対象の #{model_name} が存在しません。"
      }
    end
  end
end
