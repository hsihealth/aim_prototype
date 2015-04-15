package messages

import models.Application

object ApplicationMessages {
  case class ApplicationCreated(app: Application)
  case class UserRoleChanged(app: Application, roles: List[String])
  case class UserAuthorizedTenantChanged(tenantIds: List[String])
}
