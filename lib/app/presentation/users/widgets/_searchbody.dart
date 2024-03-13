part of '../view/users_view.dart';

ListView _searchbody(UsersViewModel consumer) {
  return ListView.builder(
    itemCount: consumer.filterData?.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: Text("${consumer.filterData?[index].userId}"),
          title: Text("${consumer.filterData?[index].title}"),
        ),
      );
    },
  );
}
