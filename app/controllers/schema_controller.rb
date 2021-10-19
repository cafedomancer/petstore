class SchemaController < ActionController::Base
  def openapi
    render file: Rails.root.join('schema/openapi.yaml')
  end

  def rapidoc
    render file: Rails.root.join('schema/rapidoc.html')
  end
end
