package core

import akka.actor.Actor

object UserActor

class UserActor extends Actor {
  import messages.UserMessages._

  def receive: Receive = {
    case UserCreated(user) =>
    case UserRoleChanged(app, roles) =>
    case UserAuthorizedTenantChanged(tenantIds) =>
  }
}
