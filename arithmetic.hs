-- A Virtual Machine (VM) for Arithmetic (template)

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving (Eq,Show) -- for equality and printing

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP
  deriving (Eq,Show) -- for equality and printing
addP :: PP -> PP -> PP
addP I m = (T m)
addP (T n) m = T (addP n m)

-- Rational numbers
data QQ =  QQ II PP

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S n) m = addN (multN n m) m

----------------
-- II Arithmetic
----------------


----------------
-- QQ Arithmetic
----------------


----------------
-- Normalisation
----------------


----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------


----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O)
    print $ multN (S (S O)) (S (S (S O)))

    print $ addP (T I) (T I)
    -- result = T (T (T I))
    print $ addP  (T (T I)) (T I)
    -- result =  T (T (T (T I)))
    print $ addP (T (T (T I))) (T (T (T (T I))))
    -- result =  T (T (T (T (T (T (T (T I)))))))
    print $ addP (T (T (T (T (T (T I)))))) (T (T I))
    -- result = T (T (T (T (T (T (T (T (T I))))))))
    print $ addP (T (T (T I))) (I)
    -- result = T (T (T (T I)))





    -- runhaskell arithmetic.hs
