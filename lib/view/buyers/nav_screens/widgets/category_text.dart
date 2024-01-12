import 'package:flutter/material.dart';
class CategoryText extends StatelessWidget {
   CategoryText({Key? key}) : super(key: key);
  final List<String> _categoriesLabel= ['food','vegetable','egg','tea','fruit','fast food','milk'];

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Padding(
        padding:  const EdgeInsets.all(9.0),
        child:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Categories',style: TextStyle(fontSize: 19),),
            Container(
              height: 40,
              child: Row(
                children: [
                  Expanded(child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: _categoriesLabel.length,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActionChip(
                          backgroundColor: Colors.yellow.shade900,
                          onPressed: (){},
                          label: Center(child: Text(_categoriesLabel[index],
                            style: const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),))),
                    );

                  })),
                  IconButton(onPressed: (){},
                      icon: const Icon(Icons.arrow_forward_ios))

                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
