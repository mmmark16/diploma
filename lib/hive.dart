import 'package:hive/hive.dart';

class ExampleWidgetModel {
  void doSome() async {
    while (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    var box = await Hive.openBox<User>('testBox');
    final user = User('', "");
    final userFromBox = box.getAt(0);
    print(userFromBox);
  }
}
    class User {
    String email;
    String pass;

    User(this. email, this.pass);

    @override
    String toString() => 'Email: $email, Password: $pass';
}
    class UserAdapter extends TypeAdapter<User> {
      @override
      final typeId = 0;

      @override
      User read(BinaryReader reader) {
        final email = reader.readString();
        final pass = reader.readString();

        return User(email, pass);
      }

      @override
      void write(BinaryWriter writer, User obj) {
        writer.writeString(obj.email);
        writer.writeString(obj.pass);
      }
    }