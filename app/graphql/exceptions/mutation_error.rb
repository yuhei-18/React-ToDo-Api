module Exceptions
  class MutationError < StandardError
    attr_reader :field

    def initialize(code, message, field: nil)
      super message
      @code = code
      @field = field
    end

    def code
      raise NotImplementedError.new '@code id not implemented' if @code.blank?

      @code
    end
  end
end
