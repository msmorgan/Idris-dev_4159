module InfUtil

%default total

public export
inf : Bool -> Type -> Type
inf True a = Inf a
inf False a = a
