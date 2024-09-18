import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/features/assets_view/presenter/cubit/assets_view_cubit.dart';
import 'package:tractian_challenge/features/assets_view/presenter/cubit/assets_view_states.dart';
import 'package:tractian_challenge/features/assets_view/presenter/widgets/tree_widget.dart';

class AssetsViewPage extends StatefulWidget {
  const AssetsViewPage(this._assetsViewCubit, {super.key, required this.id});

  final AssetsViewCubit _assetsViewCubit;
  final String id;

  @override
  State<AssetsViewPage> createState() => _AssetsViewPageState();
}

class _AssetsViewPageState extends State<AssetsViewPage> {
  @override
  void initState() {
    widget._assetsViewCubit.getAssets(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    widget._assetsViewCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget._assetsViewCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Assets'),
          backgroundColor: const Color.fromRGBO(23, 25, 45, 1),
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              GoRouter.of(context).go('/');
            },
          ),
        ),
        body: BlocBuilder(
          bloc: widget._assetsViewCubit,
          builder: (context, state) {
            if (state is AssetsViewLoadingState) {
              widget._assetsViewCubit.getAssets(widget.id);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AssetsViewSuccessState) {
              return TreeMenu(
                root: state.data,
              );
            } else {
              String message = '';
              if (state is AssetsViewErrorState) {
                message = state.message;
              }
              return Text('ERROR $message');
            }
          },
        ),
      ),
    );
  }
}
