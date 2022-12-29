
import 'package:flutter/material.dart';

termsAndConditions(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "I Accept",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color.fromARGB(255, 33, 0, 39),
    title: const Text(
      "Privacy Policy",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    content: SizedBox(
      // width: 300,
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              _termAndCondition,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

const _termAndCondition = ''' 
This website, scipro.in and all subdomains of scipro.in, hereinafter
referenced as site or website, are operated by VECTORWIND-TECH
SYSTEMS PRIVATE LIMITED. Throughout the site, the terms “we”, “us” and
“our” refer to VECTORWIND. VECTORWIND offers this website,
including all information, tools and services available from this site to you,
the user, conditioned upon your acceptance of all terms, conditions, policies
and notices stated here.
By visiting our site and/ or purchasing something from us, you engage in our
“Service” and agree to be bound by the following terms and conditions
(“Terms of Service”, “Terms”), including those additional terms and
conditions and policies referenced herein and/or available by hyperlink.
These Terms of Service apply to all users of the site, including without
limitation users who are browsers, vendors, customers, and/ or contributors
of content.
Please read these Terms of Service carefully before accessing or using our
website. By accessing or using any part of the site, you agree to be bound by
these Terms of Service. If you do not agree to all the terms and conditions of
this agreement, then you may not access the website or use any services. If
these Terms of Service are considered an offer, acceptance is expressly
limited to these Terms of Service.
Any new features or tools which are added to the current website shall also
be subject to the Terms of Service.
''';
contactus(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "Ok",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.amber),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color.fromARGB(255, 33, 0, 39),
    title: const Text(
      "Contact us",
      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
    ),
    content: SizedBox(
      // width: 300,
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              _contactus,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

const _contactus = ''' 
Contact Us

If for any reason, you wish to cancel an order that you have placed, it has to
be done by calling our
Vectorwind-tech systems pvt.ltd. (By phone number: +91 90489 00024)
Door no.4/461, 2nd floor

Suite# 151, Valamkottil towers
Judgemukku, Thrikkakara p.o
Kochi 682021
India and follow it up with an email stating your order number BEFORE THE
MATERIAL is despatched.
After the study material has been despatched WE WILL NOT BE ABLE TO
CANCEL any order. NO REFUND WILL BE made for materials that have
been shipped.
''';
