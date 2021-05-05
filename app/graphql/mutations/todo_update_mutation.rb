module Mutations
  class TodoUpdateMutation < BaseMutation
    include Validators::GraphqlValidator

    class BlankError < Exceptions::MutationError
      def initialize(message, field=nil)
        super 'BLANK', message, field: field
      end
    end

    class InvalidError < Exceptions::MutationError
      def initialize(message, field=nil)
        super 'INVALID', message, field: field
      end
    end

    class RecordNotFoundError < Exceptions::MutationError
      def initialize(message, field=nil)
        super 'RECORD_NOT_FOUND', message, field: field
      end
    end

    graphql_name 'TodoUpdate'
    description 'Todo 情報の更新'

    argument :id, ID, required: true

    argument :title, String, required: true

    argument :content, String, required: true

    argument :priority, Integer,  required: false

    argument :due_date, Types::Scalars::DateTimeScalar,  required: false

    argument :is_done, Boolean, required: false

    field :todo, Types::Objects::TodoObject, null: true do
      description 'Todo 情報'
    end

    field :todo_errors, [Types::Objects::TodoErrorObject], null: false do
      description 'ミューテーション実行中に発生した Todo エラーリスト'
    end

    def resolve(id:, title:, content:, priority: nil, due_date: nil, is_done: false)
      validate_input_required id: id, title: title, content: content
      validate_input_number id: id, priority: priority

      todo = Todo.find_by(id: id)

      validate_todo todo: todo

      todo.title = title
      todo.content = content
      todo.priority = priority
      todo.due_date = due_date
      todo.is_done = is_done
      todo.save!

      { todo: todo, todo_errors: [] }

    rescue BlankError, RecordNotFoundError, InvalidError => e
      field = e.field
      {
        todo: nil,
        todo_errors: [
          { code: e.code, field: field, message: e.message }
        ]
      }
    end

    private

    def validate_input_required(id:, title:, content:)
      raise BlankError.new('id が空です。', %w[input id]) if id.blank?
      raise BlankError.new('title が空です。', %w[input title]) if title.blank?
      raise BlankError.new('content が空です。', %w[input content]) if content.blank?
    end

    def validate_input_number(id:, priority:)
      raise InvalidError.new('値の形式が正しくありません。', %w[input id]) unless /^[\d]+$/.match? id.to_s

      unless priority.nil?
        raise InvalidError.new('値の形式が正しくありません。', %w[input priority]) unless /^[\d]+$/.match? priority.to_s
      end
    end

    def validate_todo(todo:)
      raise RecordNotFoundError.new('対象の todo が存在しません。', %w[record todo]) if todo.blank?
    end
  end
end