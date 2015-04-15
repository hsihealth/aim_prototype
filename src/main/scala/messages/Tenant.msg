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
  parent       Tenant       # parent tenant; may be nil for top level tenant
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
  parent          Tenant              # parent tenant; may be nil for top level tenant
  subsidiaries    list[Tenant]        # list of subsidiaries
  accessible_apps list[Application]   # list of accessible applications
  tenant_groups   list[TenantGroup]   # list of tenant groups
  role_groups     list[RoleGroup]     # list of application role groups
  users           list[User]          # list of users belonging to the tenant
}

document TenantGroup
{
  # A tenant group set up for a tenant
  required:
  name            string        # Name of the group
  target_tenant   Tenant        # (sub) target tenant the group is set up for
  parent          Tenant        # parent tenant this tenant group belongs to

  optional:
  description     string        # description of the group
  user_ids        list[string]  # list of ID of users assigned to the group
}

document RoleGroup
{
  # A role group set up for a tenant
  required:
  name            string        # name of the group
  parent          Tenant        # parent tenant this role group belongs to
  app             Application   # application for which the role group is setup

  optional:
  description     string        # Description of the group
  user_ids        list[string]  # list of IDs of users assigned to the group
  roles           list[string]  # name of subset of roles from the application
}

document UserTenantGroup
{
  # a link between a user and tenant group the user is assgined to
  required:
  user            User          # User to be linked to the group
  tenant_group    TenantGroup   # Tenant group the user may be assigned to
}

document UserRoleGroup
{
  # A link between a user and a role group the user is assigned to
  required:
  user            User          # User to be linked to the group
  role_group      RoleGroup     # role group the user may be assigned to
}



