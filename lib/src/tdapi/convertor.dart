part of 'tdapi.dart';

TdObject convertToObject(String query) {
  if (query != null) {
    final newJson = json.decode(query);
    print("convertToObject");
    print(newJson);
    final object = allObjects[newJson['@type']](newJson);
    return object;
  } else {
    return null;
  }
}
