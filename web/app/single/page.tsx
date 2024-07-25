import React from "react";
import HeroListing from "@/components/Listing/HeroListing";
import NavBar from "@/components/General/Navbar";
import Footer from "@/components/General/Footer";

const page = () => {
  return (
    <div className="bg-listingBg">
      <NavBar />
      <HeroListing />
      <Footer />
    </div>
  );
};

export default page;
