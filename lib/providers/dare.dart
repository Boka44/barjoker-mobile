List<String> types = [
  'Dare',
  'Success',
  'Punishment'
];

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
}
