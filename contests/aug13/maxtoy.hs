{--
  HackerRank aug13 20/20 contest: Mark & Toys.
  04 Aug 2013
  Input: First line with two inputs N (total number of toys) and K (money), 
    followed by a line containing N integers which are prices
  7 50
  1 12 5 111 200 1000 10
  Output: Max number of toys that can be purchased
  4
--}
import Data.List

-- i: index
-- amt: total cost of the bought toys
-- (x:xs): price list of toys
-- m: money at hand
-- len: total number of toys
ntoy i amt (x:xs) money len
    | amt > money = i - 1
    | amt == money = i
    | i == len = i
    | otherwise = ntoy (i + 1) (amt + x) xs money len

main = do
    n <- getLine
    lst <- getLine
    let nL = words n
    let len = read $ head nL :: Int
    let money = read $ last nL :: Int
    let listInt = sort (map read $ words lst :: [Int])
    let tIn = ntoy 0 0 listInt money len
    print tIn
