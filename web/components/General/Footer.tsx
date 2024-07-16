"use client";
import Image from "next/image";
import { CiLocationOn } from "react-icons/ci";
import { FiPhone } from "react-icons/fi";
import { RxEnvelopeClosed } from "react-icons/rx";
import Navbar from "./Navbar";

const Footer = () => {
  return (
    <div>
      <Navbar />
      <div className="flex items-center justify-center">
        {/* Page */}

        <footer className="bg-[#00010F] w-screen text-white py-12 md:px-6 font-nunito text-sm">
          <div className="lg:mx-32 text-left justify-start flex-col px-4 sm:px-3 lg:px-8">
            {/* FIrst line */}
            <div className="flex flex-col md:flex-row justify-between my-10">
              <div className="flex-row justify-between">
                <Image className="pb-4" src="/terra_black.png" alt="Logo" height={90} width={126} />
                <p>
                  We are a dedicated team of agents ready, <br /> to give you the best deals on
                  properties for <br /> sale, rent or lease
                </p>
              </div>
              {/* Second line */}
              <div className="w-full md:w-6/12">
                <h1 className="my-4 pb-2 mt-4 text-2xl md:text-3xl">Subscribe to our newsletter</h1>
                <div className="flex flex-col sm:flex-row space-y-6 sm:space-y-0 sm:items-center">
                  <input
                    type="email"
                    className="flex lg:w-full mr-4 md:w-4/6 h-16 bg-inherit border-2 rounded-3xl
                     py-2 px-4 text-white"
                    placeholder="enter your email address"
                  />
                  <button
                    className="bg-terrablue hover:bg-terrablue text-white w-2/5 rounded-3xl ml-1 px-10 h-16 focus:outline-none focus:ring-2 focus:ring-terrablue lg:w-3/12 md:w-2/6 py-0.5 text-lg flex items-center justify-center"
                    type="submit"
                  >
                    Subscribe
                  </button>
                </div>
              </div>
            </div>

            {/* 2nd grid */}
            <div className="grid grid-cols-2 gap-y-8 md:space-x-10 md:grid-cols-3 border-t-2 pt-12">
              {/* Menu */}
              <div className="">
                <h3 className="text-lg font-bold pb-7">Menu</h3>
                <ul className="space-y-2">
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Home
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Search
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      About Us
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Contact Us
                    </a>
                  </li>
                </ul>
              </div>

              {/* Socials */}
              <div>
                <h3 className="text-lg font-bold pb-7">Social</h3>
                <ul className="space-y-2">
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Facebook
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Instagram
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Twitter
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Youtube
                    </a>
                  </li>
                </ul>
              </div>
              {/* Contact */}
              <div className="lg:my-0">
                <h3 className="text-lg font-bold pb-7">Contact</h3>
                <ul className="space-y-2">
                  <li>
                    <a
                      href="mailto:info@example.com"
                      className="text-gray-400 hover:text-blue-500 flex"
                    >
                      <RxEnvelopeClosed className="mr-2" />
                      terra@gmail.com
                    </a>
                  </li>
                  <li>
                    <a href="tel:+15551234567" className="text-gray-400 hover:text-blue-500 flex">
                      <FiPhone className="mr-2" />
                      terra_company
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500 flex">
                      <CiLocationOn className="mr-2" /> American House, Accra
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
  );
};

export default Footer;
