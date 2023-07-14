type tm = Var of string | Lam of string * tm | App of tm * tm
