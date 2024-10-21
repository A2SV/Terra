import React from "react";
import Image from "next/image";
import one from "@/public/01.png";
import two from "@/public/02.png";
import three from "@/public/03.png";
import four from "@/public/04.png";
import vision1 from "@/public/vision1.jpeg";
import vision2 from "@/public/vision2.jpeg";
import vision3 from "@/public/vision3.png";
import mission1 from "@/public/mission1.jpeg";
import mission2 from "@/public/mission2.jpeg";
import mission3 from "@/public/mission3.jpeg";
import aboutpic3 from "@/public/aboutpic3.jpeg";
import a2sv from "@/public/a2sv.png";
import Navbar from "../General/Navbar";
import Footer from "../General/Footer";

const MissionSection = () => {
  return (
    <div className="flex flex-col min-h-screen">
      <Navbar />
      <div className="flex justify-center">
        <div className="relative flex w-full h-[383px]">
          <div className="absolute inset-0 z-30 pt-28 pl-18 ml-4 lg:ml-0 lg:pl-44 w-11/12 -mr-52 flex flex-col text-center md:w-9/12 md:ml-28 lg:items-start">
            <p className="text-lg pb-7 font-bold font-nunito text-white md:text-[42px] ">
              Discover Your Ideal Home
            </p>
            <p className="text-lg pb-5 font-bold font-nunito text-white md:text-[42px]">
              with Terra
            </p>
            <p className="text-lg lg:text-lg font-nunito font-medium text-white md:text-xl md:mt-2 lg:text-left">
              Seamlessly Rent, Buy, or Sell Properties. Uncover<br></br> Your Next Dream Space
              Today.
            </p>
          </div>

          <div className="w-full h-full absolute inset-0 z-10">
            <Image
              src={aboutpic3}
              alt="about3"
              className="object-cover overflow-hidden w-full h-full"
            />
          </div>
        </div>
      </div>
      <div className="flex justify-between items-center mx-[180px] mt-[90px]">
        <div className="h-[330px] w-[460px] font-nunito">
          <p className="text-4xl font-bold pb-6">Our Mission</p>
          <article className="text-[17px] leading-tight">
            <p>
              Our mission is to simplify the search for both temporary and permanent housing by
              providing a transparent, affordable, and convenient platform that connects tenants,
              buyers, and sellers with suitable accommodations and properties. We are dedicated to
              ensuring that students, NSPs, young professionals, temporary workers, and potential
              homeowners can find reliable and cost-effective housing solutions without the usual
              stress and hassle. Unlike other platforms that predominantly feature high-priced
              apartments, Terra seeks to bring everyone on board by including underrepresented
              listers and offering a diverse range of affordable housing options suiting everyone’s
              need.
            </p>
          </article>
        </div>
        <div className="flex flex-col space-y-5">
          <div className="flex space-x-5">
            <Image
              src={mission1}
              alt="missi1"
              className="object-cover hidden h-[178px] w-[216px] lg:block"
            />
            <Image
              src={mission2}
              alt="missi2"
              className="object-cover hidden h-[178px] w-[216px] lg:block"
            />
          </div>
          <Image
            src={mission3}
            alt="missi3"
            className="object-cover hidden h-[180px] w-[452px] lg:block"
          />
        </div>
      </div>

      <div className="flex justify-between items-center mx-[180px] mt-[90px]">
        <div className="flex flex-col space-y-5">
          <div className="flex space-x-5">
            <Image
              src={vision1}
              alt="visi"
              className="object-cover hidden h-[178px] w-[216px] lg:block"
            />

            <Image
              src={vision2}
              alt="visi2"
              className="object-cover hidden h-[178px] w-[216px] lg:block"
            />
          </div>
          <Image
            src={vision3}
            alt="visi3"
            className="object-cover hidden h-[180px] w-[452px] lg:block"
          />
        </div>
        <div className="h-[220px] w-[460px] font-nunito">
          <p className="text-4xl font-bold pb-6">Our Vision</p>
          <article className="text-[17px] leading-tight">
            <p>
              We envision a future where finding both short-term and permanent housing is a seamless
              and straightforward process for everyone. By addressing the current challenges in the
              real estate market, we aim to become the go-to platform for anyone seeking temporary
              accommodations or looking to buy or sell properties, fostering a community where
              trust, convenience, and innovation are paramount.
            </p>
          </article>
        </div>
      </div>

      <div className="flex flex-col mx-[200px] my-[90px] h-[500px]">
        <p className="font-nunito font-bold text-4xl">Why Choose Us</p>
        <div className="flex mt-[60px]">
          <div>
            <Image src={one} alt="one" className="w-56 object-fill hidden lg:block" />
            <div className="w-52 text-xl font-bold font-nunito ml-11 -mt-12">
              Transparency and Reliability
            </div>
            <div className="w-44 text-sm font-nunito mt-2 ml-11">
              At Terra, we prioritize transparency in all our listings. Our robust verification
              system ensures that all properties are accurately represented, providing our users
              with reliable information they can trust.
            </div>
          </div>

          <div>
            <Image src={two} alt="two" className="w-56 object-fill hidden lg:block" />
            <div className="w-52 text-xl font-bold font-nunito ml-11 -mt-12">
              Tailored Property Listings
            </div>
            <div className="w-44 text-sm font-nunito mt-2 ml-11">
              We understand the unique needs of our target users. Whether you are a student, an NSP,
              or a young professional, Terra offers tailored listings that meet your specific
              requirements, making it easier to find the perfect accommodation.
            </div>
          </div>

          <div>
            <Image src={three} alt="three" className="w-56 object-fill hidden lg:block" />
            <div className="w-52 text-xl font-bold font-nunito ml-11 -mt-12">
              Seamless Communication
            </div>
            <div className="w-44 text-sm font-nunito mt-2 ml-11">
              Our integrated real-time chat feature facilitates direct communication between tenants
              and landlords. This ensures a smooth and efficient rental process, reducing the time
              and effort required to secure a property.
            </div>
          </div>

          <div>
            <Image src={four} alt="four" className="w-56 object-fill hidden lg:block" />
            <div className="w-52 text-xl font-bold font-nunito ml-11 -mt-12">
              Affordable and Convenient
            </div>
            <div className="w-44 text-sm font-nunito mt-2 ml-11">
              Terra is dedicated to providing affordable housing options without compromising on
              quality. Our platform helps users find cost-effective accommodations that are
              conveniently located and suitable for their needs.
            </div>
          </div>
        </div>

        <div className="flex justify-center w-full ">
          <Image src={a2sv} alt="a2sv" className="mt-36 object-fill lg:block w-[570px] pb-14" />
        </div>
      </div>
      <div className="mt-80">
        <Footer />
      </div>
    </div>
  );
};

export default MissionSection;
