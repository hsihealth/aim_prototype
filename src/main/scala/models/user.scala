package models

// import scala.slick.driver.Postgres.simple._
import service.EncryptionService

// class User(val email: String, var name: String, var description: String) extends DomainEntity {
//   var encryptedPassword: String = ""

//   def encryptPassword(password: String) = {
//     encryptedPassword = EncryptionService.encryptTest(password)
//   }
// }

case class User(id: Long,
                email: String,
                tenant: Option[Tenant] = None,
                isActive: Boolean = true
                )
