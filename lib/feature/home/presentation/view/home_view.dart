import 'package:flutter/material.dart';

import '../../../../core/utils/dependancy_injection/dependancy_injection.dart';
import '../manager/home_cubit.dart';
import '../widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<HomeCubit>(),
        child: HomeViewBody(),
      ),
    );
  }
}
