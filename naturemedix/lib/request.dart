import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RequestPlantForm extends StatefulWidget {
  const RequestPlantForm({super.key});

  @override
  _RequestPlantFormState createState() => _RequestPlantFormState();
}

class _RequestPlantFormState extends State<RequestPlantForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scientificNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<File> _imageFiles = [];
  File? _mainImage;

  Future<void> _pickMainImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _mainImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    setState(() {
      _imageFiles = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Request'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: 800,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Plant Request',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Plant name:',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the plant name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                controller: scientificNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Scientific name:',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the scientific name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                controller: descriptionController,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  labelText: 'Description:',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the description';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: _mainImage == null
                                    ? const Icon(Icons.image, size: 80, color: Colors.grey)
                                    : Image.file(_mainImage!, fit: BoxFit.cover),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: _pickMainImage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.teal,
                                  side: const BorderSide(color: Colors.teal),
                                ),
                                child: const Text('Upload', style: TextStyle(color: Colors.teal)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Plant Images:', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Static image display in cards without an extra upload button
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _imageFiles.isNotEmpty
                          ? _imageFiles.map((file) {
                              return Card(
                                elevation: 3,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Image.file(file, fit: BoxFit.cover),
                                ),
                              );
                            }).toList()
                          : [
                              Card(
                                elevation: 3,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey.shade200,
                                  child: const Center(child: Text('No Images')),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey.shade200,
                                  child: const Center(child: Text('No Images')),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey.shade200,
                                  child: const Center(child: Text('No Images')),
                                ),
                              ),
                            ],
                    ),
                     const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: _pickImages, // Only the top button is used to upload more images
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     foregroundColor: Colors.teal,
                    //     side: const BorderSide(color: Colors.teal),
                    //   ),
                    //   child: const Text('Upload More Images', style: TextStyle(color: Colors.teal)),
                    // ),
                    // const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text('Send', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
