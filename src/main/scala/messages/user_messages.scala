package messages

import models._

object UserMessages {
  case class UserCreated(user: User)
  case class UserRoleChanged(app: Application, roles: List[String])
  case class UserAuthorizedTenantChanged(tenantIds: List[String])
}
