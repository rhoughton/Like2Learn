module Multiply.Bug.Fix where

multiply :: Int -> Int -> Int
multiply a b = do
  return $ a * b

--this null kyword checks if list is empty
isListEmpty = null nameOList

-- !! will give you the value in an index
secondP = listofPrime !! 1
-- 1st in a list use 'head' and to get the last use 'last'
--why would we ever want to get all but the last? 
secondP = init listofPrime
--create a list of even #s (or whatever 'step' you want)
evenList = [2,4..20]
-- same w/ letters
letters = ['a','c'..'z']
--perfect example of lazy, haskell won't generate the list until we need it
infinitePow10 = [10,20..]
-- so that list isn't actually generated until we need say, 50, 60, etc
many2s = take 10 (repeat 2)
-- [2,2,2,2,2,2,2,2,2,2] same with "replicate"
r = replicate 10 2
-- the bar | which was driving me crazy seems to separate so
list = [x * 2 | x <- [1..10]]
-- [2,4,6,8,10]
--we can make the above routine even crazier with a qualifier, but this sure fine tunes our output
list = [x * 2 | x <- [1..10], x*2<=15]
--it seems to narrate the above line you could say:
--output x*2, by DOING x as a number from this list each time, BUT only output #s less than 15
list = [x * 2 | x <- [1..10], x 'mod' 13==0, x 'mod' 9 ==0]
--above will only print out #s divisible by 13 & 9
-- wow finally an explanation of tuple that makes sense! A list (or array?) needs 
randTup = (15, "this is a string!")
--above is called a tuple pair, this is a common thing

--fyi to self, I tested and haskell doesn't seem to care about spaces, yay! 
multiply a b = a * b

--below is a simply factorial program w/ pattern matching syntax
fac 0 = 1
fac n = n * fac (n-1)

main = print (fac 42)
--recursion is the power horse of recursion
-- single quote is char, double is list of chars aka strings

isEdge : char->bool
isEdge c=c=='-'|c=='_'

module CamelCase where
import Data.Char(toUpper)
toCamelCase :: String -> String
toCamelCase "" = ""
--same as saying [] = []
toCamelCase [c] = [c]
toCamelCase ("_",x | "-",x) | 
    if
        then ""
        else [c]
    = toUpper x : toCamelCase cs
toCamelCase (c:cs) = c : toCamelCase cs



--want to just keep crushing through more challenges? :) 
-- types in imperative languages like C are the way I think, but in haskell the word type is a bit diff
--roussel's paradox, but I don't need type theory to haskell lol
--creating structs in other langauges, is similar to what haskell does with creating types. 
data Fruit = 
    Apple Double 
    Banana Double
type Fruit = (Double, Double)
sizeofFruit :: Fruit -> Double