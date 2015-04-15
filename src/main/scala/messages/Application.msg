document Application
{
  # Representation of an application

  required:
  id          [integer,string] # primary key of the app
  uuid        string        # univerval unique identifier of the tenant
  name        string        # name of the tenant
  is_active   boolean(true) # flag to indicate if the tenant is still active
  roles       list[string]  # Application specific roles

  optional:
  description string        # brief description of the tenant
}

document ApplicationDetail
{
  # Detailed message of an application
  required:
  id          [integer,string] # primary key of the app
  uuid        string        # univerval unique identifier of the tenant
  name        string        # name of the tenant
  is_active   boolean(true) # flag to indicate if the tenant is still active
  roles       list[string]  # Application specific roles

  optional:
  description string        # brief description of the tenant
  tenants     list[Tenant]  # list of active tenants who are granted access to the application
}

document ApplicationTenant
{
  # A link between an application and tenant who is granted access to the application
  required:
  application Application   # Application that grants the linked tenant for access
  tenant      Tenant        # Tenant having access to the application
}

document AuthenticationInfo
{
  # represent user who is authenticated to log into an application
  required:
  is_valid    boolean       # flag to indicate if the user is authenticated and is valid for the related application
  id          string        # ID of the authenticated user; should be Nil if invalid
  email       string        # email of the authenticated user; should be Nil if invalid
  app_uuid    string        # UUID of the application for which the user is authenticated
  auth_token  string        # Authentication token to be used for future action; should be Nil if invalid
  roles       list[string]  # list of flattened roles the authenticated user has for an app; should be empty if invalid
  tenant_ids  list[string]  # list of UUIDs of tenants whose data are accessible by the authenticated user; should be empty if invalid
}
