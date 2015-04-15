package messages

import models.{Tenant, User, RoleGroup}

object TenantMessages {
  case class CreateTenant(tenant: Tenant)
  case class UserCreated(tenant: Tenant, user: User)
  case class RoleGroupRegistered(roleGroup: RoleGroup )
}