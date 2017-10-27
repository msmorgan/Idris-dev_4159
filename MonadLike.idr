module MonadLike

import InfUtil

%default total

export
data MonadLike : Bool -> Type -> Type where
  Pure : a -> MonadLike c a

  Bind : MonadLike c1 a ->
         (a -> MonadLike c2 b) ->
         MonadLike (c1 || c2) b

  InfBind : MonadLike True a ->
            Inf (a -> MonadLike c2 b) ->
            MonadLike True b

export
pureC : (c : Bool) -> a -> MonadLike c a
pureC c = Pure

export
(>>=) : MonadLike c1 a -> inf c1 (a -> MonadLike c2 b) -> MonadLike (c1 || c2) b
(>>=) {c1 = True} = InfBind
(>>=) {c1 = False} = Bind


