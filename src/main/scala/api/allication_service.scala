package api

import akka.actor.ActorRef
import scala.concurrent.ExecutionContext
import spray.routing.Directives
import spray.routing.Directive.pimpApply
import core.TenantActor
import models._

class ApplicationService(actor: ActorRef)(implicit executionContext: ExecutionContext)
  extends Directives with DefaultJsonFormats {

  implicit val appFormat = jsonFormat5(Application)

  val route =
    path("applications") {
      get {
        ctx =>
          ctx.complete {
            List(Application(1,"AIM", "Test App", List("admin", "developer")))
          }
      } ~
      post {
       handleWith { msg: String => actor ! msg; "{}" }
      }
    }
}