class QuestionsSerializer
  include JSONAPI::Serializer
  attributes :question, :correct_answer, :options, :image
end
