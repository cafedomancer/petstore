class ErrorSerializer < ApplicationSerializer
  def to_json(*)
    @object.errors.to_json
  end
end
