class PublisherSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :site, :is_deleted, :created_at, :updated_at
end
