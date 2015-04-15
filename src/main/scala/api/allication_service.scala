package api

import akka.actor.ActorRef
import scala.concurrent.ExecutionContext
import spray.routing.Directives
import core.TenantActor
import messages.ApplicationMessages._

class ApplicationService(actor: ActorRef)(implicit executionContext: ExecutionContext)
  extends Directives with DefaultJsonFormats {

  // import core.ApplicationActor._

  // implicit val sendMessageFormat = jsonObjectFormat(UserRoleChanged.type)

  val route =
    path("applications") {
      post {
       handleWith { msg: String => actor ! msg; "{}" }
      }
    }

}