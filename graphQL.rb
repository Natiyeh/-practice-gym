class Types::Membership < GraphQL::Schema::Object
  field :name, String, null: false
  field :description, String, null: false
  field :price, Integer, null: false
end

class Types::Merchandise < GraphQL::Schema::Object
  field :name, String, null: false
  field :description, String, null: false
  field :price, Integer, null: false
  field :photo
end
