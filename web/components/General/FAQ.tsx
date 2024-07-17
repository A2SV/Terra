import React from "react";
import Accordion from "@/components/General/Accordion";
import FAQImage from "@/public/faq_woman.svg";
import Image from "next/image";

const FAQ = () => {
  return (
    <div className="w-screen h-auto flex justify-center mt-5 ">
      <div className="w-10/12 lg:w-9/12 flex flex-col lg:flex-row">
        <div className="order-2 lg:order-2 divide-y space-y-2 flex flex-col border w-full lg:w-1/2">
          <Accordion
            title="What types of properties can I list on Terra?"
            answer="You can list a variety of properties on Terra, including apartments, houses, students' hostels, hotels, guest houses, office spaces, shops, warehouses, and event spaces."
          />
          <Accordion
            title="How do I create a listing on Terra?"
            answer="Creating a listing on Terra is straightforward. Simply sign up or log in to your account, navigate to the 'Create Listing' section, fill in the required property details, and upload high-quality photos."
          />
          <Accordion
            title="How can I ensure my listing gets noticed?"
            answer="To ensure your listing gets noticed, provide detailed and accurate descriptions, upload high-quality images, and consider using our premium listing options to boost visibility."
          />
          <Accordion
            title="How can I get my property featured on the homepage?"
            answer="To get your property featured on the homepage, you can opt for our premium listing service. This will increase the visibility of your property and attract more potential buyers or renters. This feature is currently under construction and will be available soon."
          />
          <Accordion
            title=" Can I edit my listing after it's published?"
            answer="Yes, you can edit your listing at any time. Simply log in to your account, go to your profile. Under 'My Listings,' select the listing you want to edit. Make the necessary changes and save them."
          />
          <Accordion
            title="Is there a fee for listing a property on Terra?"
            answer="No, currently there is no fee for listing a property on Terra. You can list your properties for free."
          />
        </div>
        <div className="order-1 lg:order-2 w-full lg:w-1/2 px-10 mb-20 lg:mb-0">
          <p className="text-xs text-terrablue font-montserrat mb-3">Got Questions</p>
          <h1 className="font-montserrat font-semibold text-gray-700 text-xl md:text-3xl mb-5">
            Frequently Asked Questions
          </h1>
          <Image className="w-11/12" src={FAQImage} alt="Woman thinking about a question" />
        </div>
      </div>
    </div>
  );
};

export default FAQ;
