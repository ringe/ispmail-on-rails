json.virtual_users @virtual_users do |virtual_user|
  json.id           virtual_user.id
  json.domain_id    virtual_user.domain_id
  json.email        virtual_user.email
end
