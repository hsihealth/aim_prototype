package models

// import scala.slick.driver.Postgres.simple._

// class RoleGroup(var name: String, var description: String) extends DomainEntity {
//   var tenantId: String = ""
// }

case class RoleGroup(app: Application, tenent: Tenant, roles: List[String] = Nil)
