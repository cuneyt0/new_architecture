part of '../view/users_view.dart';

AppBar _appbar(UsersViewModel consumer) {
  return AppBar(
    title: consumer.isSearch == true
        ? TextFormField(
            controller: consumer.searchController,
            onChanged: (_) {
              consumer.controllerChanged();
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
    actions: [
      IconButton(
          onPressed: () => consumer.searchButtonOnTap(),
          icon: consumer.isSearch == true
              ? const Icon(Icons.cancel_outlined)
              : const Icon(Icons.search)),
    ],
  );
}
