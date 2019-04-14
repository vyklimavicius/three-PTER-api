class GameSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_id
end
