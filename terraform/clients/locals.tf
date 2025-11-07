locals {
  scopes = {
    solver_director = module.solver_director.scopes
  }

  roles = {
    solver_director = module.solver_director.roles
  }
}
