class Dare {
 String message;
 final String id;
 final String userId;
 final bool isDefault;
 final String type;

 Dare({
   this.id,
   this.message,
   this.isDefault,
   this.type,
   this.userId
 });
 Dare.fromMap(Map snapshot, String id) :
        id = id ?? '',
        message = snapshot['message'] ?? '',
        isDefault = snapshot['isDefault'] ?? false,
        type = snapshot['type'] ?? '',
        userId = snapshot['userId'] ?? '';

  toJson() {
    return {
      "id": id,
      "message": message,
      "isDefault": isDefault,
      "type" : type,
      "userId" : userId
    };
  }
}
