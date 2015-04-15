document User
{
  # User of an application
  required:
  id          string    # entity ID of the user
  email       string    # email of the user
  tenant      Tenant    # the tenant this user belongs to
  is_active   boolean   # flag to indicate if the user is still active
}

document UserDetail
{
  required:
  id          string    # entity ID of the user
  email       string    # email of the user
  email_hash  string    # email hash
  tenant      Tenant    # the tenant this user belongs to
  is_active   boolean   # flag to indicate if the user is still active

  optional:
  app_roles   map[list[string]] # A map of flattened application roles the user has, keyed by app_id
  tenant_ids  list[string]  # list of UUIDs of tenants whose data are accessible by the authenticated user; should be empty if invalid
}
