class MapCompare {
  //map键值对是否有更新
  static bool isUpdated(Map<String, dynamic> newMap, Map<String, dynamic> oldMap) {
    for (String key in newMap.keys) {
      if (newMap[key] is Map<String, dynamic>) {
        if (MapCompare.isUpdated(newMap[key], oldMap[key])) {
          return true;
        }
      } else {
        if (newMap[key] != null && newMap[key] != oldMap[key]) {
          return true;
        }
      }
    }
    return false;
  }
}
