class HighScoresSerializer
  include JSONAPI::Serializer
  attributes :user_id, :number_correct
end
