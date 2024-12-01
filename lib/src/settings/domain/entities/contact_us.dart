
import '../../../home/data/models/home_data_dto.dart';
import '../../data/models/contact_us_dto.dart';

class ContactUs {
  String? title;
  String? subtitle;
  MarkupDto? contactForm;
  String? contactAddress;
  String? contactMap;
  String? contactEmail;
  String? contactPhone;
  String? contactWhatsApp;

  ContactUs(
      {this.title,
      this.subtitle,
      this.contactForm,
      this.contactAddress,
      this.contactMap,
      this.contactEmail,
      this.contactPhone,
      this.contactWhatsApp});

  factory ContactUs.fromDto(ContactUsDto json) => ContactUs(
        title: json.title,
        subtitle: json.subtitle,
        contactForm: json.contactForm,
        contactAddress: json.contactAddress,
        contactMap: json.contactMap,
        contactEmail: json.contactEmail,
        contactPhone: json.contactPhone,
        contactWhatsApp: json.contactWhatsApp,
      );
}
