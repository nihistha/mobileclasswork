class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final _gap = const SizedBox(height: 10);
  // List<DropdownMenuItem<String>>? cities;


  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _cityController;

  @override
  void initState(){
    super.initState();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _cityController = TextEditingController();

    cities = [
      const DropdownMenuItem(
        value: 'Kathmandu',child: Text('Kathmandu'), ),
      const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
      const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
    ];
  }
  List<DropdownMenuItem> cities = [
    const DropdownMenuItem(
      value: 'Kathmandu', // timile select garda
      child: Text('Kathmandu'), // user lai dekhaune
    ),
    const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
    const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
  ];



  final _key = GlobalKey<FormState>();

  List<Student> students = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter fname';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter lname';
                  }
                  return null;
                },
              ),
              _gap,
              DropdownButtonFormField(
                items: cities,
                onChanged: (value) {
                  _cityController.text = value.toString();
                },
                decoration: const InputDecoration(
                  hintText: 'Select city',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select city';
                  }
                  return null;
                },
              ),
              _gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      final student = Student(
                        fname: _fnameController.text,
                        lname: _lnameController.text,
                        city: _cityController.text,
                      );
                      setState(() {
                        students.add(student);
                      });
                    }
                  },
                  child: const Text('Add Student'),
                ),
              ),
              _gap,
              const Text(
                'Student List',
                style: TextStyle(fontSize: 20),
              ),
              students.isEmpty
                  ? const Text('No data')
                  : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index)=> const Divider(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    // return ListTile(
                    //   leading: const Icon(Icons.person),
                    //   title: Text(students[index].fname),
                    //   subtitle: Text(students[index].city),
                    //   trailing: IconButton(
                    //     icon: const Icon(Icons.delete),
                    //     onPressed: () {
                    //       setState(() {
                    //         students.removeAt(index);
                    //       });
                    //     },
                    //   ),
                    // );
                    return SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Card(
                        color: Colors.deepPurpleAccent,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                students[index].fname,
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                students[index].lname,
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
