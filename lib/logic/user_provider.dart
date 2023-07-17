import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/model/user.dart';

final userProvider =
    StateProvider<User>((ref) => const User(id: '', name: '', imageUrl: []));
