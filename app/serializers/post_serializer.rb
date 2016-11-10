class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :latitude, :longitude, :altitude, :accuracy, :altitude_accuracy, :expire_time, :created_at
end
