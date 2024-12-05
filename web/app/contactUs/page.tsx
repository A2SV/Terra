import ContactUsHero from "@/components/ContactUs/ContactUsHero";
import Navbar from "@/components/General/Navbar";
import Footer from "@/components/General/Footer";
import React from "react";
import ContactUsDetails from "@/components/ContactUs/ContactUsDetails";

const ContactUs = () => {
  return (
    <main className="w-full">
      <Navbar />
      <ContactUsHero />
      <ContactUsDetails />
      <Footer />
    </main>
  );
};

export default ContactUs;
