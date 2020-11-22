module Data.MyEither where

import Prelude
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.MyMaybe (MyMaybe(Some, None), isSome)
import Helper (notImplemented)

data MyEither a b
  = This a
  | That b

derive instance genericMyEither :: Generic (MyEither a b) _

instance showMyEither :: (Show a, Show b) => Show (MyEither a b) where
  show = genericShow

instance eqMyEither :: Eq (MyEither a b) where
  eq :: MyEither a b -> MyEither a b -> Boolean
  eq = notImplemented

asThis :: forall a b. MyEither a b -> MyMaybe a
asThis = case _ of
  This a -> Some a
  That _ -> None

asThat :: forall a b. MyEither a b -> MyMaybe b
asThat = case _ of
  This _ -> None
  That b -> Some b

isThis :: forall a b. MyEither a b -> Boolean
isThis = asThis >>> isSome

isThat :: forall a b. MyEither a b -> Boolean
isThat = not <<< isThis -- asThat >>> isNone
