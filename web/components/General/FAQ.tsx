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
            title="What does Step Worth specialize in?"
            answer="At Step Worth, we stand out through our commitment to quality, innovative solutions, and a dedicated team of experts with years of experience in the fiber optics industry.We continuously invest in the latest advancements in fiber optics technology to provide our clients with state-of-the-art solutions.Check the customer review section to see the great feedback from clients"
          />
          <Accordion
            title="How can I contact Step Worth?"
            answer="At Step Worth, we stand out through our commitment to quality, innovative solutions, and a dedicated team of experts with years of experience in the fiber optics industry.We continuously invest in the latest advancements in fiber optics technology to provide our clients with state-of-the-art solutions.Check the customer review section to see the great feedback from clients"
          />
          <Accordion
            title="What sets Step Worth apart from competitors?"
            answer="At Step Worth, we stand out through our commitment to quality, innovative solutions, and a dedicated team of experts with years of experience in the fiber optics industry.We continuously invest in the latest advancements in fiber optics technology to provide our clients with state-of-the-art solutions.Check the customer review section to see the great feedback from clients"
          />
          <Accordion
            title="Is Step Worth hiring?"
            answer="At Step Worth, we stand out through our commitment to quality, innovative solutions, and a dedicated team of experts with years of experience in the fiber optics industry.We continuously invest in the latest advancements in fiber optics technology to provide our clients with state-of-the-art solutions.Check the customer review section to see the great feedback from clients"
          />
          <Accordion
            title=" Do you offer custom solutions for unique project requirements?"
            answer="At Step Worth, we stand out through our commitment to quality, innovative solutions, and a dedicated team of experts with years of experience in the fiber optics industry.We continuously invest in the latest advancements in fiber optics technology to provide our clients with state-of-the-art solutions.Check the customer review section to see the great feedback from clients"
          />
          <Accordion
            title="What payment methods does Step Worth accept?"
            answer="At Step Worth, we stand out through our commitment to quality, innovative solutions, and a dedicated team of experts with years of experience in the fiber optics industry.We continuously invest in the latest advancements in fiber optics technology to provide our clients with state-of-the-art solutions.Check the customer review section to see the great feedback from clients"
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
