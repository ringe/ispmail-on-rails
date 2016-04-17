json.virtual_alias do
  json.id           @virtual_alias.id
  json.source       @virtual_alias.source
  json.destination  @virtual_alias.destination
  json.domain_id    @virtual_alias.domain_id
end
