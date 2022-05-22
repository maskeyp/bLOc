import 'package:business_logic_component/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHomeScreen extends StatelessWidget {
  const CubitHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetcState>(
          listener: (context, state) {
            if (state == InternetcState.gained) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Connected'),
                backgroundColor: Colors.green,
              ));
            } else if (state == InternetcState.lost) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'Internet Not Connected',
                  style: TextStyle(fontSize: 38),
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetcState.gained) {
              return const Text('Connected!');
            } else if (state == InternetcState.lost) {
              return const Text('Not Connected!');
            } else {
              return const Text('Loading!!!...');
            }
          },
        ),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     //if(state ==)
        //     // == to check value
        //     // is to check data type

        //     if (state is InternetGainedState) {
        //       return Text('Connected!');
        //     } else if (state is InternetLostState) {
        //       return Text('Not Connected!');
        //     } else {
        //       return Text('Loading!!!...');
        //     }
        //   },
        // ),
      )),
    );
  }
}
