  import 'package:flutter/material.dart';
  import 'package:pretty_qr_code/pretty_qr_code.dart';
  import 'package:flutter/services.dart';
  class GenerateCodePage extends StatefulWidget {
    const GenerateCodePage({super.key});

    @override
    State<GenerateCodePage> createState() => _GenerateCodePageState();
  }

  class _GenerateCodePageState extends State<GenerateCodePage> {
    String qrData = '';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Generate QR Code',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter text or URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
                style: const TextStyle(fontSize: 16),
                onSubmitted: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              if (qrData.isNotEmpty)
                Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: PrettyQr(
                          data: qrData,
                          size: 200,
                          roundEdges: true,
                          elementColor: Colors.deepPurple.shade400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: qrData));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Copied to Clipboard"),
                            backgroundColor: Colors.deepPurple.shade400,
                          ),
                        );
                      },
                      child: const Text(
                        "Copy QR Data",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    }
  }
