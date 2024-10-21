import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/content_view.dart';
import 'package:timesmedlite/ui/components/nothing_widget.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/m_list_tile.dart';
import 'package:timesmedlite/ui/widgets/m_scaffold.dart';
import 'package:timesmedlite/ui/widgets/m_text_field.dart';
import 'package:timesmedlite/ui/widgets/space.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../widgets/loading_widget.dart';
import '../auth/doctor_sign_up_page.dart';

class CommonList extends StatefulWidget {
  final String title;
  final bool? fo;
  final bool? doctor;
  final bool? nurse;
  final String? adminId;
  const CommonList({super.key, required this.title, this.fo, this.doctor, this.nurse, this.adminId});

  @override
  State<CommonList> createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {

  late final bloc = ApiBuilderBloc(path:widget.nurse?? false ?'Get_Nurse_by_Admin' :widget.doctor?? false ?'GetDoctorDetails_By_Admin' : 'Get_FrontOffice_by_Admin',
    vka: widget.doctor?? false ? false : true,
    api2: widget.doctor?? false ? true : false,
    query: {
    'Admin_Id': '${widget.adminId ??1}'
    }
  );

  @override
  void initState() {
    bloc.add(Load());
    setState(() {});
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MTheme.THEME_COLOR,
        title:  Text('${widget.title} List',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: MTextField(
              controller: controller,
              label: 'Search ${widget.title} by Name & phone',
              onChanged: (val){
                // if(val.isEmpty){
                //   search = data;
                // }else{
                //   print(search.length);
                // }
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: BlocProvider(create:(_)=>bloc,
              child: ApiBuilder(
                loading: LoadingWidget(),
                empty: NothingWidget(title: 'No ${widget.title}',onRefresh: ()=> bloc.add(Refresh()),),
                jsonBuilder: (data , load) {
                  List<Map<String, dynamic>> search = [];
                  search = List.from(data);
                  final val = controller.text;
                  if(val.trim().isNotEmpty) {
                    search = data.where((element) => ('${element.values}'.trim().toLowerCase().contains(val.toLowerCase()) ?? false)).toList();
                  }
                  return ListView.builder(
                    key:ValueKey('list Length ${search.length}'),
                    itemCount: search.length,
                    itemBuilder: (c ,i){
                      return MListTile(
                        shadow:Colors.grey.withOpacity(0.3),
                        borderColor:Colors.red,
                        animate: true,padding: EdgeInsets.all(10),
                        actions: [
                          CustomSlidableAction(onPressed: (BuildContext context) {  },
                            child: Icon(Icons.edit,size: 28,)),
                          CustomSlidableAction(onPressed: (BuildContext context) {  },
                            child: Icon(Icons.delete,size: 28,),),
                        ],
                        child: Row(
                          children: [
                            CircleAvatar(radius: 30,child: Icon(Icons.person),),
                            Space(15),
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                ContentView3(label : 'Name : ', content: '${((search[i]['Gender']?? '') == 'Female') ? 'Ms.' : 'Mr.'}${search[i]['User_Firstname']?? ''}'),
                                ContentView3(label : 'Id : ', content: '${search[i]['User_Id']?? ''}'),
                                ContentView3(label : 'Mobile : ', content: '${search[i]['Mobile_Number']?? ''}'),
                                ContentView3(label : 'Email : ', content: '${search[i]['Email_Id'] ?? ''}'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),

        floatingActionButton : Padding(
          padding: const EdgeInsets.only(bottom: 40,),
          child: IconButton(
              iconSize: 40,
              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(MTheme.THEME_COLOR)),
              onPressed: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DoctorSignUpPage()));
                context.push(Routes.addNewDoctor);
              }, icon: Icon(Icons.add)),
        ),
    );
  }
}
