package api

import akka.actor.ActorRef
import scala.concurrent.ExecutionContext
import spray.routing.Directives
import core.TenantActor

import messages.TenantMessages._
import models._

class TenantService(actor: ActorRef)(implicit executionContext: ExecutionContext)
  extends Directives with DefaultJsonFormats {

  implicit val appFormat = jsonFormat5(Application)
  implicit val tenantFormat = jsonFormat4(Tenant)

  implicit val roleGroupFormat = jsonFormat3(RoleGroup)
  implicit val createTenantFormat = jsonFormat1(CreateTenant)

  val route =
    path("tenant") {
      post {
        handleWith { tenent: CreateTenant => actor ! tenent; "{}" }
      }
    } ~
    path("tenants") {
      get { ctx =>
         ctx.complete {
           val list = TenantAction.GetTenants
           list
         }
      }
    }
}