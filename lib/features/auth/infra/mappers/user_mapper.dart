import '../../../../core/adapters/infra/mappers/mapper.dart';
import '../../domain/entities/user_entity.dart';
import '../repositories/models/user_model.dart';

final class UserMapper extends Mapper<UserEntity, UserModel> {
  @override
  UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      password: model.password,
      login: model.login,
      role: model.role,
      createdAt: model.createdAt,
      processedAt: model.processedAt,
      excluded: model.excluded,
      token: model.token,
    );
  }

  @override
  UserModel toModel(UserEntity entity) {
    return UserModel(
      name: entity.name,
      password: entity.password,
      login: entity.login,
      role: entity.role,
      createdAt: entity.createdAt,
      processedAt: entity.processedAt,
      excluded: entity.excluded,
      id: entity.id,
      token: entity.token,
    );
  }
}
