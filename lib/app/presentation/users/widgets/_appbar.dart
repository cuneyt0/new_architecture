part of '../view/users_view.dart';

AppBar _appbar(UsersViewModel viewModel) {
  return AppBar(
    title: Selector<UsersViewModel, bool>(
      selector: (_, provider) => provider.isSearch,
      builder: (context, value, child) => viewModel.isSearch == true
          ? TextFormField(
              controller: viewModel.searchController,
              onChanged: (_) {
                viewModel.controllerChanged();
              },
              decoration:
                  const InputDecoration(hintText: 'Ne aramak istersiniz?'),
            )
          : const Text(
              "Users",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
    ),
    actions: [
      Selector<UsersViewModel, bool>(
        selector: (_, provider) => provider.isSearch,
        builder: (context, value, child) => Semantics(
          label: "SearchButton",
          child: IconButton(
              onPressed: () => viewModel.searchButtonOnTap(),
              icon: viewModel.isSearch == true
                  ? const Icon(Icons.cancel_outlined)
                  : const Icon(Icons.search)),
        ),
      ),
      InkWell(
        onTap: () {
          AppNavigation.navigatorKey.currentState?.context
              .push(AppRoutes.notificationView.path);
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.notifications),
        ),
      )
    ],
  );
}
