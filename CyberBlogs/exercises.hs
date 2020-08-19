data List a = Nil | Cons 
data ShowList where
ShowNil :: Showlist
ShowCons :: Show a => a -> ShowList

showListHead :: Show a => ShowList -> Maybe a
showListHead ShowNil       = Nothing 

class Countable a where count :: a -> Int 

data AnyList where
    AnyNil :: AnyList
    AnyCons :: a -> AnyList -> AnyList
-- sounds like pattern matching is done as opposed to switch
reverseAnyList :: AnyList -> AnyList
reverseAnyList AnyNil ys = ys
reverseAnyList (x:xs) ys = AnyCons x (concatAnyList xs ys) 

concatAnyList ::

