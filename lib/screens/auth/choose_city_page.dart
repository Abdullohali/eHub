import 'package:ehub/models/cities_model.dart';
import 'package:ehub/screens/auth/register_page.dart';
import 'package:ehub/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../allCubit/auth_cubit.dart';
import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class ChooseCityPage extends StatelessWidget {
  const ChooseCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.klinearGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: mainAppbar(context, isBack: true),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 30.h, bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text("Ваш город",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    FutureBuilder(
                        future: EHubRegisterService().cityService(),
                        builder:
                            (context, AsyncSnapshot<List<Citiyes>?> snapshot) {
                          if (snapshot.hasData) {
                            var snap = snapshot.data;
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, __) {
                                return ListTile(
                                  onTap: () async {
                                    context.read<AuthCubit>().variants.add(
                                        snapshot.data![0].variants![__].id,);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()));
                                  },
                                  title: Text(
                                      snapshot.data![0].variants![__].name
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  contentPadding: EdgeInsets.zero,
                                  shape: Border(
                                      bottom: BorderSide(
                                          width: 0.5,
                                          color: AppColor.kWhite
                                              .withOpacity(0.7))),
                                );
                              },
                              itemCount: snapshot.data![0].variants!.length,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        })
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
