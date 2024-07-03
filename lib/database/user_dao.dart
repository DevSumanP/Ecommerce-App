import 'package:ecommerce/database/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllPeople();

  @Query('SELECT name FROM User')
  Stream<List<String>> findAllPeopleName();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findPersonById(int id);

  @insert
  Future<void> insertPerson(User person);
}