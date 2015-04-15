package core

import akka.actor.{Props,Actor}

class TenantActor extends Actor {

  import UserActor._
  import messages.TenantMessages._

  val userActor = context.actorOf(Props[UserActor])
  def receive: Receive = {
    case CreateTenant(tenent) =>
    case UserCreated(tenant, user) =>
      userActor ! user
    case RoleGroupRegistered(group) =>
  }
}
