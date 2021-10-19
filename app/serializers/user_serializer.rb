class UserSerializer < ApplicationSerializer
  def to_json(*)
    @object.to_json(only: [:id, :username, :first_name, :last_name, :email, :phone])
  end
end
