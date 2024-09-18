import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';

import 'cubit/home_states.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage(
    this._homeCubit, {
    super.key,
  });
  final HomeCubit _homeCubit;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void dispose() {
    widget._homeCubit.close();
    super.dispose();
  }

  @override
  void initState() {
    widget._homeCubit.getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget._homeCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(23, 25, 45, 1),
          title: SizedBox(
            height: 17,
            child: Image.asset(
              'assets/images/logo/LOGO_TRACTIAN.png',
            ),
          ),
        ),
        body: BlocBuilder(
          bloc: widget._homeCubit,
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeSuccessState) {
              return _buildLocationsList(state.data);
            } else {
              return Column(
                children: [
                  const Text("ERROR"),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    child: _buildLocationsList(widget._homeCubit.locations),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildLocationsList(List<ResultCompany> locations) {
  return ListView.builder(
    itemCount: locations.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 21.0, right: 21.0),
        child: FilledButton.icon(
          icon: const Icon(Icons.location_on),
          iconAlignment: IconAlignment.start,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Colors.blue,
            ),
            alignment: Alignment.centerLeft,
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 32.0,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          onPressed: () {
            GoRouter.of(context).push('/${locations[index].id}/assets');
          },
          label: Text(
            '${locations[index].name.toString()} Unit',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      );
    },
  );
}
