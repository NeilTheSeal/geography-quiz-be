class HighScoresSerializer
  include JSONAPI::Serializer
  attributes :username, :score
end
