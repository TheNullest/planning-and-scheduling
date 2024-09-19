import 'package:uuid/uuid.dart';

bool isValidUUID(String uuid) {
  final regex = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
  );
  return regex.hasMatch(uuid);
}

String uuidGenerator() => const Uuid().v4();
