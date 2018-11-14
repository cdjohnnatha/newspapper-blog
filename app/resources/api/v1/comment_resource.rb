class Api::V1::CommentResource < JSONAPI::Resource
  attribute :content

  has_one :user
  has_one :article
end
