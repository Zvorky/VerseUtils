# MapUtils Module by @zvorky


using { /Verse.org/Simulation }
using { /Verse.org/Random }


MapUtils<public> := module:

    # 1. GET KEYS
    # Returns an array containing all keys of the map.
    # Useful for iterating or picking something random.
    (Map:[k]v where k:subtype(comparable), v:type).Keys<public>()<transacts>:[]k =
        for(Key -> Value : Map):
            Key

    # 2. GET VALUES
    # Returns an array containing only the values.
    (Map:[k]v where k:subtype(comparable), v:type).Values<public>()<transacts>:[]v =
        for(Key -> Value : Map):
            Value

    # 3. GET OR DEFAULT
    # Attempts to get a value. If the key doesn't exist, returns the Default value
    # instead of failing. Avoids giant 'if' blocks.
    (Map:[k]v where k:subtype(comparable), v:type).Get<public>(Key:k, Default:v):v =
        if (FoundValue := Map[Key]):
            return FoundValue
        else:
            return Default

    # 4. MERGE MAPS
    # Combines two maps. If there are duplicate keys,
    # the values from MapB overwrite those from MapA.
    (MapA:[k]v where k:subtype(comparable), v:type).Merge<public>(MapB:[k]v)<transacts>:[k]v =
        var Res:[k]v = MapA
        for:
            Key -> Val : MapB
            set Res[Key] = Val
        do:
        return Res

    # 5. INVERT MAP (SWAP KEY/VALUE)
    # Transforms keys into values and vice-versa.
    # WARNING: If there are duplicate values in the original, data will be lost,
    # because keys must be unique. The type 'v' must also be 'comparable'.
    (Map:[k]v where k:subtype(comparable), v:subtype(comparable)).Invert<public>()<transacts>:[v]k =
        var Res:[v]k = map{}
        for:
            Key -> Val : Map
            set Res[Val] = Key
        do:
        return Res

    # 6. RANDOM ENTRY
    # Returns a random tuple (Key, Value) from the map.
    # Fails if the map is empty.
    GetRandom<public>(Map:[k]v where k:subtype(comparable), v:type)<transacts><decides>:tuple(k, v) =
        Keys := Map.Keys()
        Keys.Length > 0
        I := GetRandomInt(0, Keys.Length - 1)
        Key := Keys[I]
        (Key, Map[Key])