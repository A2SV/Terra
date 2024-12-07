"use client";

import React, { useState, FC } from "react";
import { IoIosArrowDropdown, IoIosArrowDropup } from "react-icons/io";
interface AccordionProps {
  title: string;
  answer: string;
}

const Accordion: FC<AccordionProps> = ({ title, answer }) => {
  const [accordionOpen, setAccordionOpen] = useState(false);

  return (
    <div className="flex flex-col justify-center">
      <button onClick={() => setAccordionOpen(!accordionOpen)} className="">
        <div className="flex h-20 pl-10 pr-7 justify-between items-center">
          <span className="font-montserrat font-light text-lg md:text-xl text-left text-black">
            {title}
          </span>
          {accordionOpen ? (
            <IoIosArrowDropup className="text-xl md:text-3xl shrink-0 text-terrablue mx-1 " />
          ) : (
            <IoIosArrowDropdown className="text-xl md:text-3xl shrink-0 text-terrablue mx-1" />
          )}
        </div>

        <div
          className={`grid overflow-hidden transition-all duration-300 ease-in-out text-slate-600 text-sm ${
            accordionOpen ? "grid-rows-[1fr] opacity-100 mb-4" : "grid-rows-[0fr] opacity-0"
          }`}
        >
          <div className="overflow-hidden font-montserrat font-light text-base md:text-lg text-gray-700 pl-10 pr-7 text-left">
            {answer}
          </div>
        </div>
      </button>
    </div>
  );
};

export default Accordion;
