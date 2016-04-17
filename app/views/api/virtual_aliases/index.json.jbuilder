json.virtual_aliases @virtual_aliases do |virtual_alias|
  json.id             virtual_alias.id
  json.domain_id      virtual_alias.domain_id
  json.source         virtual_alias.source
  json.destination    virtual_alias.destination
end
