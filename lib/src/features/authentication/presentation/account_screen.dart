import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/src/features/authentication/presentation/account_screen_controller.dart';
import 'package:flutter_template/src/utils/async_value_ui.dart';

/// Simple account screen showing some user info and a logout button.
class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      accountScreenControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final state = ref.watch(accountScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: state.isLoading
            ? const CircularProgressIndicator()
            : const Text('Account'),
        actions: [
          TextButton(
            onPressed: state.isLoading
                ? null
                : () async {
                    ref
                        .read(accountScreenControllerProvider.notifier)
                        .signOut();
                  },
            child: Text(
              'Logout',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Center(child: Text('Welcome Home')),
    );
  }
}
