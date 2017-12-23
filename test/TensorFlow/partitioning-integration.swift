// RUN: %target-swift-frontend -tensorflow -emit-sil -verify %s | FileCheck %s

import TensorFlow

public func testTensor() {
  var x = Tensor<Float>(oneD: 1.0, 2.0, 3.0)
  x += x
  x -= x
  print(x)
}

// FIXME: The optimizer is crashing, so I can't get this to deabstract all the
// way.  For now, just check that the expected ops get deserialized from the
// tensorflow library.

// CHECK:  __tfop_Add__tt__
// CHECK:  __tfop_Sub__tt__