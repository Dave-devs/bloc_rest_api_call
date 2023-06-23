import 'package:bloc_rest_api_call/model/user_repo.dart';
import 'package:bloc_rest_api_call/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../model/User.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(const UserLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rest Api With Bloc'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is UserDataState) {
              List<User> userList = state.users;
              return Column(
                children: [
                  Expanded(child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DetailPage(e: userList[index],))
                          );
                        },
                        child: Card(
                          color: Colors.blueAccent,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Text(
                                userList[index].id,
                                style: const TextStyle(color: Colors.white),
                            ),
                            title: Text(
                                userList[index].firstName,
                                style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                                userList[index].lastName,
                                style: const TextStyle(color: Colors.white),
                            ),
                            trailing: CircleAvatar(
                              backgroundImage: NetworkImage(userList[index].avatar),
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              );
            }
            if(state is UserErrorState) {
              return const Center(
                child: Text('Oops! error occurred'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
