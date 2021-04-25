import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/screens/home/home_event.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/authentication_state.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.updateDataStream})
      : super(key: key);

  final Stream<Type> updateDataStream;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthenticationBloc _authenticationBloc;
  HomeBloc _homeBloc;

  StreamSubscription _updateDataSub;

  final double basePadding = 10.0;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _homeBloc = HomeBloc(authenticationBloc: _authenticationBloc);

    _authenticationBloc.listen((AuthenticationState state) {
      if (state is AuthenticationUserFetched) {
        if (mounted) {
          _homeBloc.add(HomeInitialized(user: UserService.user));
        }
      }
    });
    _updateDataSub = widget.updateDataStream.listen((event) {
      if (event == HomePage) {
        _homeBloc.add(SilentReload(user: UserService.user));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _updateDataSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _bloc = BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState state) {
        if (state is HomeLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Loading...",
                style: Theme.of(context)
                  .textTheme
                  .headline6),
              SizedBox(width: 16),
              CircularProgressIndicator()
            ])]);
        }

        if (state is HomeSuccess) {
          //return _getMobileWarningList(state.mobileWarnings);
        }

        if (state is HomeError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning, color: Colors.red, size: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  SizedBox(width: 5),
                  Text("There was an error loading the data",
                    style: Theme.of(context)
                      .textTheme
                      .headline5),
                ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  SizedBox(width: 5),
                  Text("If the problem persists, please contact an administrator",
                    style: Theme.of(context)
                      .textTheme
                      .bodyText1)
                ])
            ]);
        }

        return Container();
      },
    );

    return RefreshIndicator(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(minHeight: 300),
          child: _bloc
        ),
      ),
      onRefresh: () {
        _homeBloc.add(HomeInitialized(user: UserService.user));
        return _homeBloc
          .skip(1)
          .firstWhere((element) => element is HomeSuccess || element is HomeError);
      },
    );
  }
}
