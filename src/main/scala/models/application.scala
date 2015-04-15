package models

// import scala.slick.driver.Postgres.simple._

// class Application(var name: String, var description: String) extends DomainEntity {
//   var roles: List[String] = List[String]()

//   def ensureRoles(roleNames: List[String]) = {
//     for (role <- roleNames) {
//       if (!roles.contains(role))
//         roles = roles :+ role
//     }
//   }
// }

case class Application(
    id: Long,
    name: String,
    description: String = "",
    roles: List[String] = Nil,
    isActive: Boolean = true)
