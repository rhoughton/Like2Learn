What 3 things can Haxl do?
By using Haxl what happens to your data-fetching code?
How does the Sigma service work?
What is FXL?
Where does the library name HAXL originate? 
What are applicative functors?
What is an applicative type class?
What does the <*> operator mean? 

numCommonFriends x y =

    length <$> (intersect <$> friendsOf x <*> friendsOf y) 
--'do' needs a compiler transformation in order to work?
friendsOfFriends :: Id -> Haxl [Id]
friendsOfFriends id = do
  friends <- friendsOf id
  fofs <- mapM friendsOf friends
  return (concat fofs)
--above the friends of id are fetched, then the friends of those friends are fetched (concurrently)  

--what's traverse?
