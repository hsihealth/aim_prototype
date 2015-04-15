package models

object TenantAction{
  def GetTenants: List[Tenant] = {
    List(Tenant(1, "T1", "Tenant 1", true), Tenant(2, "T2", "Tenant 2", true))
  }
}

// class Tenant(var name: String, var description: String) extends DomainEntity
case class Tenant(id: Long,
                  name: String,
                  description: String,
                  isActive: Boolean = true)

