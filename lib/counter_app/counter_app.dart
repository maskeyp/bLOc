import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasincremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    // ignore: unnecessary_const
                    content: const Text(
                      'Incremented',
                      style: TextStyle(color: Colors.green),
                    ),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.wasincremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Decremented',
                      style: TextStyle(color: Colors.red),
                    ),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'oh!! Negative${state.counterValue}',
                    style: const TextStyle(fontSize: 30),
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'Nice ${state.counterValue.toString()}',
                    style: const TextStyle(fontSize: 30),
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: const TextStyle(fontSize: 30),
                  );
                }
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    //context.bloc<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    //context.bloc<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
