json.virtual_user do
  json.id         @virtual_user.id
  json.email      @virtual_user.email
  json.domain_id  @virtual_user.domain_id
end
