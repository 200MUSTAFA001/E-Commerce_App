import 'package:api_app/app_router.dart';
import 'package:api_app/logic/cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserAddressesPage extends StatelessWidget {
  const UserAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  context.push(AppRouter.addNewAddressPage);
                },
                child: Text("add new address"),
              ),
            ),
          ),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is AddressLoaded) {
                final addressesList = state.userAddressesList;
                return SliverList.builder(
                  itemCount: addressesList.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(6),
                    child: ListTile(
                      leading: Text("${addressesList[index].addressID}"),
                      title: Text(addressesList[index].name),
                      subtitle: Text(addressesList[index].mobileNumber),
                      trailing: IconButton(
                          onPressed: () {
                            context
                                .read<AddressCubit>()
                                .removeAddress(addressesList[index].addressID!);
                          },
                          icon: Icon(Icons.clear, color: Colors.red)),
                    ),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text("no data"),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
