# VerseUtils By [@zvorky](https://github.com/zvorky)
Utils Module Pack for UEFN Verse

## Modules
- ### [MapUtils](/utils_map.verse)
  - **Map.Keys()**  
    _Returns an array containing all keys of the map._
    
  - **Map.Values()**  
    _Returns an array containing only the values._
  - **Map.Get(Key, Default)**  
    _Attempts to get a value. If the key doesn't exist, returns the Default value instead of failing. Avoids giant 'if' blocks._
    
  - **Map.Merge(AnotherMap)**  
    _Combines two maps. If there are duplicate keys, the values from MapB overwrite those from MapA._
    
  - **Map.Invert()**  
    _Transforms keys into values and vice-versa.  
    **WARNING**: If there are duplicate values in the original, data will be lost, because keys must be unique. The type 'v' must also be 'comparable'._
    
  - **Map.GetRandom()**  
    _Returns a random tuple (Key, Value) from the map. Fails if the map is empty._
    
