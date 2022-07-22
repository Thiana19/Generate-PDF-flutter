import 'package:cvkgenpdf/save_file_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: generateresumebutton(),
    );
  }

  Widget generateresumebutton() {
    return TextButton(
      onPressed: _createcertificate,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
      ),
      child: const Text(
        'Generate Resume',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _createcertificate() async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    document.pageSettings.orientation = PdfPageOrientation.portrait;
    document.pageSettings.margins.all = 0;
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get the page size
    final Size pageSize = page.getClientSize();

    
    page.graphics.drawImage(PdfBitmap(await _readImageData('resume.jpg')),
        Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
    //Create font
    final PdfFont nameFont =
        PdfStandardFont(PdfFontFamily.helvetica, 27, style: PdfFontStyle.bold);
    final PdfFont controlFont = PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    final PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 12);
    final PdfFont infoFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    final PdfFont educationFont = PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
    final PdfFont uniFont = PdfStandardFont(PdfFontFamily.helvetica, 10);
    final PdfFont descFont = PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.italic);


    // add profile pic
    // asset image (working())
    page.graphics.drawImage(PdfBitmap(await _readImageData('prof.jpg')),
      Rect.fromLTWH(20, 67, 80, 80));

      
    // ignore: todo
    // network image TODO  
    //  var url =
    //     "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg";
    // var response = await get(Uri.parse(url));
    // var data = response.bodyBytes;
    //  PdfBitmap image = PdfBitmap(data);
    // //Draw an image to the document.
    // page.graphics.drawImage(
    //     image,
    //     Rect.fromLTWH(
    //         0, 0, page.getClientSize().width, page.getClientSize().height));

  // asset image
    page.graphics.drawImage(PdfBitmap(await _readImageData('prof.jpg')),
      Rect.fromLTWH(20, 67, 80, 80));

    // name
    double x = _calculateXPosition("CISSE MAMADOU THIANA", nameFont, pageSize.width);
    page.graphics.drawString("CISSE MAMADOU THIANA", nameFont,
        bounds: const Rect.fromLTWH(110, 75, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

    // Job Title
    x = _calculateXPosition("JUNIOR SOFTWARE ENGINEER", controlFont, pageSize.width);
    page.graphics.drawString("JUNIOR SOFTWARE ENGINEER", controlFont,
        bounds: const Rect.fromLTWH(200, 133, 0, 0),
        brush: PdfSolidBrush(PdfColor(20, 58, 86)));

    // email
    final String emailText = "thianz19@gmail.com";
    x = _calculateXPosition(emailText, infoFont, pageSize.width);
    page.graphics.drawString(emailText, infoFont,
        bounds: const Rect.fromLTWH(31, 20, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));

    // email
    final String locationText = "Palm Spring Damansara";
    x = _calculateXPosition(locationText, infoFont, pageSize.width);
    page.graphics.drawString(locationText, infoFont,
        bounds: const Rect.fromLTWH(180, 20, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));

    // website
    final String webText = "www.thiana.com";
    x = _calculateXPosition(webText, infoFont, pageSize.width);
    page.graphics.drawString(webText, infoFont,
        bounds: const Rect.fromLTWH(340, 20, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));

    // linked in
    final String linkedinText = "www.linkedin.com/in/\ncisse-mamadou-thiana-\n-4a5823202/";
    x = _calculateXPosition(linkedinText, infoFont, pageSize.width);
    page.graphics.drawString(linkedinText, infoFont,
        bounds: const Rect.fromLTWH(480, 20, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));
    
    // linked in
    final String aboutText = "Expected to receive a bachelor degree in Computer\nScience this coming November 2022, I am a hardworking\nand creative person who is able to handle multi tasks on a daily basis.\nWhile I don't have any real-life work experience,\nI've had a lot of exposure to the business environment.\nI've worked hard in my education and now I'm ready\nto apply my knowledge into practice in order to start \nup my career and achieve my goals.";
    x = _calculateXPosition(aboutText, dateFont, pageSize.width);
    page.graphics.drawString(aboutText, dateFont,
        bounds: const Rect.fromLTWH(300, 250, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));

    // Education 1
    final String bachelorText = "Bachelor of Computer Science - Software Engineering";
    x = _calculateXPosition(bachelorText, educationFont, pageSize.width);
    page.graphics.drawString(bachelorText, educationFont,
        bounds: const Rect.fromLTWH(300, 430, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));
    final String uniText = "International Islamic University Malaysia (2018-2022)";
    x = _calculateXPosition(uniText, uniFont, pageSize.width);
    page.graphics.drawString(uniText, uniFont,
        bounds: const Rect.fromLTWH(300, 450, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));
    final String edudescText = "Software engineering is a systematic engineering\napproach to software development.";
    x = _calculateXPosition(edudescText, descFont, pageSize.width);
    page.graphics.drawString(edudescText, descFont,
        bounds: const Rect.fromLTWH(300, 470, 0, 0),
        brush: PdfSolidBrush(PdfColor(143, 188, 143)));

    // divider (can be removed if not needed)
    final PdfPen linePen =
        PdfPen(PdfColor(255, 255, 255), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];
    page.graphics.drawLine(linePen, Offset(298, pageSize.height - 325),
        Offset(pageSize.width, pageSize.height - 325));

    // Education 2
    final String bachelor2Text = "Master of AI (Artificial Intelligence)";
    x = _calculateXPosition(bachelor2Text, educationFont, pageSize.width);
    page.graphics.drawString(bachelor2Text, educationFont,
        bounds: const Rect.fromLTWH(300, 530, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));
    final String uni2Text = "University of Leicester (2022-present)";
    x = _calculateXPosition(uni2Text, uniFont, pageSize.width);
    page.graphics.drawString(uni2Text, uniFont,
        bounds: const Rect.fromLTWH(300, 550, 0, 0),
        brush: PdfSolidBrush(PdfColor(255, 255, 255)));
    final String edudesc2Text = "Artificial intelligence (AI) is the ability of a computer or a robot \ncontrolled by a computer to do tasks that are usually done by \nhumans because they require human intelligence and discernment.";
    x = _calculateXPosition(edudesc2Text, descFont, pageSize.width);
    page.graphics.drawString(edudesc2Text, descFont,
        bounds: const Rect.fromLTWH(300, 570, 0, 0),
        brush: PdfSolidBrush(PdfColor(143, 188, 143)));

    // Experience 1
    final String compText = "Teczo Sdn Bhd";
    x = _calculateXPosition(compText, uniFont, pageSize.width);
    page.graphics.drawString(compText, uniFont,
        bounds: const Rect.fromLTWH(31, 250, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String titleText = "Software Developer Intern (Sept 2021- Present)";
    x = _calculateXPosition(titleText, educationFont, pageSize.width);
    page.graphics.drawString(titleText, educationFont,
        bounds: const Rect.fromLTWH(31, 270, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String jobdescText = "- Creating and managing digital platforms for clients\n- Resposible for technoligacal needs\n- Project management";
    x = _calculateXPosition(jobdescText, descFont, pageSize.width);
    page.graphics.drawString(jobdescText, descFont,
        bounds: const Rect.fromLTWH(31, 290, 0, 0),
        brush: PdfSolidBrush(PdfColor(143, 188, 143)));

    // Experience 2
    final String comp2Text = "Hanover & Tyke";
    x = _calculateXPosition(comp2Text, uniFont, pageSize.width);
    page.graphics.drawString(comp2Text, uniFont,
        bounds: const Rect.fromLTWH(31, 350, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String title2Text = "Graphic Designer (Aug 2020- May 2021)";
    x = _calculateXPosition(title2Text, educationFont, pageSize.width);
    page.graphics.drawString(title2Text, educationFont,
        bounds: const Rect.fromLTWH(31, 370, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String jobdesc2Text = "- Contributed ideas for digital marketing campaigns\n- Responsible for contacting blogs for features and \nreciprocal links";
    x = _calculateXPosition(jobdesc2Text, descFont, pageSize.width);
    page.graphics.drawString(jobdesc2Text, descFont,
        bounds: const Rect.fromLTWH(31, 390, 0, 0),
        brush: PdfSolidBrush(PdfColor(143, 188, 143)));

    // Experience 3
    final String comp3Text = "Timmerman Industries";
    x = _calculateXPosition(comp3Text, uniFont, pageSize.width);
    page.graphics.drawString(comp3Text, uniFont,
        bounds: const Rect.fromLTWH(31, 450, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String title3Text = "Web & Graphic Designer (Dec 2018- May 2020)";
    x = _calculateXPosition(title3Text, educationFont, pageSize.width);
    page.graphics.drawString(title3Text, educationFont,
        bounds: const Rect.fromLTWH(31, 470, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String jobdesc3Text = "- Created and managed digital campaigns for clients\n- Increased two clients' digital presence and \ncustomer interaction by 200%";
    x = _calculateXPosition(jobdesc3Text, descFont, pageSize.width);
    page.graphics.drawString(jobdesc3Text, descFont,
        bounds: const Rect.fromLTWH(31, 490, 0, 0),
        brush: PdfSolidBrush(PdfColor(143, 188, 143)));

    // Experience 4
    final String comp4Text = "Microsoft Malaysia";
    x = _calculateXPosition(comp4Text, uniFont, pageSize.width);
    page.graphics.drawString(comp4Text, uniFont,
        bounds: const Rect.fromLTWH(31, 550, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String title4Text = "IT Consultant (Feb 2017 - Oct 2018)";
    x = _calculateXPosition(title4Text, educationFont, pageSize.width);
    page.graphics.drawString(title4Text, educationFont,
        bounds: const Rect.fromLTWH(31, 570, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    final String jobdesc4Text = "- Offer advice and expertise to organisations to help \nthem improve their business performance in terms \nof operations, profitability, management";
    x = _calculateXPosition(jobdesc4Text, descFont, pageSize.width);
    page.graphics.drawString(jobdesc4Text, descFont,
        bounds: const Rect.fromLTWH(31, 590, 0, 0),
        brush: PdfSolidBrush(PdfColor(143, 188, 143)));

    // Skills 
    final String skills1Text = "Project Management";
    x = _calculateXPosition(skills1Text, dateFont, pageSize.width);
    page.graphics.drawString(skills1Text, dateFont,
        bounds: const Rect.fromLTWH(31, 685, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    
    final String skills2Text = "Android Development";
    x = _calculateXPosition(skills2Text, dateFont, pageSize.width);
    page.graphics.drawString(skills2Text, dateFont,
        bounds: const Rect.fromLTWH(31, 705, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

    final String skills3Text = "Web Development";
    x = _calculateXPosition(skills3Text, dateFont, pageSize.width);
    page.graphics.drawString(skills3Text, dateFont,
        bounds: const Rect.fromLTWH(31, 725, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

    final String skills4Text = "Game Development";
    x = _calculateXPosition(skills4Text, dateFont, pageSize.width);
    page.graphics.drawString(skills4Text, dateFont,
        bounds: const Rect.fromLTWH(31, 745, 0, 0),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));



    //Save and launch the document
    final List<int> bytes = document.save();
    //Dispose the document.
    document.dispose();
    //Save and launch file.
    await FileSaveHelper.saveAndLaunchFile(bytes, 'Certificate.pdf');
  }

  double _calculateXPosition(String text, PdfFont font, double pageWidth) {
    final Size textSize =
        font.measureString(text, layoutArea: Size(pageWidth, 0));
    return (pageWidth - textSize.width) / 2;
  }

  Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

}

class Red {
}
