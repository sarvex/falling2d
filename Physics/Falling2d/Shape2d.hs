{-# LANGUAGE MultiParamTypeClasses #-}

module Physics.Falling2d.Shape2d
(
DynamicShape2d(..)
, StaticShape2d(..)
)
where

import Data.Vect.Double.Base
import Physics.Falling.Shape.VolumetricShape
import Physics.Falling.Shape.Ball
import Physics.Falling.Shape.Plane
import Physics.Falling2d.Rectangle
import Physics.Falling2d.Vec1
import Physics.Falling2d.InertiaTensor2d

data DynamicShape2d = Ball2d        Ball
                      | Rectangle2d Rectangle
data StaticShape2d  = StaticBall2d        Ball
                      | StaticRectangle2d Rectangle
                      | Plane2d           (Plane Vec2)

instance VolumetricShape DynamicShape2d InertiaTensor2d InverseInertiaTensor2d Vec1 Proj3 where
  volume (Ball2d b)                            = ballVolume b 2
  volume (Rectangle2d r)                       = rectangleVolume r
  objectFrameInertiaTensor (Ball2d (Ball r)) m = InertiaTensor2d $ m * r * r / 2.0
  objectFrameInertiaTensor (Rectangle2d r)   m = rectangleInertiaTensor r m
