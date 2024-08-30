import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_app/model/profile/user_info.dart';
import 'package:state_app/model/result.dart';
import 'package:state_app/repository/profile_repository.dart';
import 'package:state_app/ui/account/account_content.dart';

final accountNotifierProvider = ChangeNotifierProvider((ref) {
  final notifier = AccountNotifier(ref.read(profileRepositoryProvider));
  notifier.fetchUserInfo();
  return notifier;
});

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(accountNotifierProvider);
    final userInfo = notifier.userInfo;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Account',
          ),
          surfaceTintColor: Colors.white,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(12),
            child: Divider(),
          ),
        ),
        body: AccountContent(userInfo),
      ),
    );
  }
}

class AccountNotifier extends ChangeNotifier {
  final ProfileRepository _profileRepository;

  AccountNotifier(this._profileRepository);

  UserInfo? userInfo;

  Future fetchUserInfo() async {
    final result = await _profileRepository.getUserInfoSample();
    if (result is Success) {
      userInfo = (result as Success<UserInfo>).data;
      notifyListeners();
    }
  }
}