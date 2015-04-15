document Tenant
{
  # representation of a tenant
  required:
  uuid        string        # univerval unique identifier of the tenant
  name        string        # name of the tenant
  description string        # brief description of the tenant
  tenant_type enum [TENANT, COMPANY, PROVIDER, BASE] # type of tenant
  is_active   boolean(true) # flag to indicate if the tenant is still active

  optional:
  parent       Tenent       # parent tenant; may be nil for top level tenant
}

document TenantDetail
{
  # detailed information of a tenant
  required:
  uuid        string        # univerval unique identifier of the tenant
  name        string        # name of the tenant
  description string        # brief description of the tenant
  tenant_type enum [TENANT, COMPANY, PROVIDER, BASE] # type of tenant
  is_active   boolean       # flag to indicate if the tenant is still active

  optional:
  parent          Tenent              # parent tenant; may be nil for top level tenant
  subsidiaries    list[Tenant]        # list of subsidiaries
  accessible_apps list[Application]   # list of accessible applications
  tenant_groups   list[TenantGroup]   # list of tenant groups
  role_groups     list[RoleGroup]     # list of application role groups
  users           list[User]          # list of users belonging to the tenant
}

document TenantGroup
{
  required:
  name        string
  subsidiary  Tanent

  optional:
  parent      Tenent        # parent tenant this tenant group belongs to
  description string
  user_ids    list[string]  # list of ID of users assigned to the group
}

document RoleGroup
{
  required:
  name        string        # name of the group
  parent      Tenent        # parent tenant this role group belongs to
  app         Application   # application for which the role group is designed

  optional:
  description string
  user_ids    list[string]  # list of IDs of users assigned to the group
  roles       list[string]  # name of subset of roles from the application
}

document UserTenantGroup
{
  required:
  user          User
  tenant_group  TenantGroup
}

document UserRoleGroup
{
  required:
  user        User
  role_group  RoleGroup
}



