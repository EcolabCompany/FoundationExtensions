import Foundation


/// Produces an immutable setter function for a given key path. Useful for composing property changes.
///
/// - Parameter keyPath: A key path.
/// - Returns: A setter function.
public func property<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>
) -> (@escaping (Value) -> Value)
  -> (Root) -> Root {
    return { update in
        { root in
            var copy = root
            copy[keyPath: keyPath] = update(copy[keyPath: keyPath])
            return copy
        }
    }
}


/// Produces an immutable setter function for a given key path and update function.
///
/// - Parameters
///   - keyPath: A key path.
///   - update: An update function.
/// - Returns: A setter function.
public func over<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>,
  _ update: @escaping (Value) -> Value
  )
  -> (Root) -> Root {

    return property(keyPath)(update)
}


/// Produces an in-place setter function for a given key path. Useful for composing value property changes efficiently.
///
/// - Parameter keyPath: A writable key path.
/// - Returns: A mutable setter function.
public func mutateProperty<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>
  )
  -> (@escaping (inout Value) -> Void)
  -> (inout Root) -> Void {

    return { update in
      { root in
        update(&root[keyPath: keyPath])
      }
    }
}

/// Takes a key path and update function all at once.
///
/// - Parameters:
///   - keyPath: A writable key path.
///   - update: An update function for a given value.
/// - Returns: A value-mutable setter function.
public func mutateOver<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>,
  _ update: @escaping (inout Value) -> Void
  )
  -> (inout Root) -> Void {

    return mutateProperty(keyPath)(update)
}

/// Produces an immutable setter function for a given key path and constant value.
///
/// - Parameters:
///  - keyPath: A key path.
///  - value: A new value.
/// - Returns: A setter function.

public func set<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>,
    _ value: Value
) -> (Root) -> Root {
        return property(keyPath) ({ _ in value })
}


/// Produces a value-mutable setter function for a given key path and new value.
///
/// - Parameters:
///   - keyPath: A writable key path.
///   - value: A new value.
/// - Returns: A value-mutable setter function.
public func mutate<Root, Value>(
    _ keyPath: WritableKeyPath<Root, Value>,
    _ value: Value
) -> (inout Root) -> Void {
    return { root in
        root = set(keyPath, value)(root)
    }
}

public func get<Root, Value>(_ kp: KeyPath<Root, Value>) -> (Root) -> Value {
    return { root in
        root[keyPath: kp]
    }
}
