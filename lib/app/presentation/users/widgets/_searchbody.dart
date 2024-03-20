part of '../view/users_view.dart';

Widget _searchbody() {
  return Selector<UsersViewModel, List<PostsEntity>?>(
      selector: (_, provider) => provider.filterData,
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text("${value?[index].userId}"),
                title: Text("${value?[index].title}"),
              ),
            );
          },
        );
      });
}
