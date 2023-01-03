class RecipeSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :title, :instructions, :minutes_to_complete, :user

end
