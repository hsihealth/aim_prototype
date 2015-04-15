package core

import akka.actor.Actor

class ApplicationActor extends Actor {
  import messages.ApplicationMessages._

  def receive: Receive = {
    case UserRoleChanged(app, roles) =>
  }
}
