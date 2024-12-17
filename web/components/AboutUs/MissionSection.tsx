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
import TeamCard from "./TeamCard";
import team1 from "@/public/team1.jpeg";
import team2 from "@/public/team2.jpeg";
import team3 from "@/public/team3.jpeg";
import team4 from "@/public/team4.jpeg";
import team5 from "@/public/team5.jpeg";
import team6 from "@/public/team6.jpeg";
import team7 from "@/public/team7.jpeg";
import team8 from "@/public/team8.jpeg";
import a2sv from "@/public/a2sv.png";
import ellipse from "@/public/ellipse.svg";
import Ellipse2 from "@/public/Ellipse2.svg";
import Star from "@/public/Star.svg";
import Star2 from "@/public/Star2.svg";
import Star3 from "@/public/Star3.svg";
import Star4 from "@/public/Star4.svg";
import Footer from "../General/Footer";

const MissionSection = () => {
  return (
    <div className="flex flex-col min-h-screen mt-[30px]">
      <div className="flex justify-center">
        <div className="relative flex w-full h-[383px]">
          <div className="absolute inset-0 z-30 pt-28 pl-18 ml-4 lg:ml-0 lg:pl-44 w-11/12 -mr-52 flex flex-col md:w-9/12 md:ml-28 lg:items-start">
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
      <div className="flex justify-between items-center mb-28 sm:mb-0 mx-[40px] mt-[60px] md:mx-[90px] md:mt-[60px] lg:mx-[180px] lg:mt-[90px] md:flex-wrap lg:flex-nowrap">
        <div className="h-[330px] w-[460px] md:w-full lg:w-[460px] font-nunito">
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
        <div className="flex-col space-y-5 lg:mt-10 ml-3">
          <div className="flex space-x-5">
            <Image
              src={mission1}
              alt="missi1"
              className="object-cover hidden md:h-[178px] md:w-[316px] lg:h-[178px] lg:w-[216px] md:block"
            />
            <Image
              src={mission2}
              alt="missi2"
              className="object-cover hidden md:h-[178px] md:w-[316px] lg:h-[178px] lg:w-[216px] md:block"
            />
          </div>
          <Image
            src={mission3}
            alt="missi3"
            className="object-cover hidden md:h-[200px] md:w-[652px] lg:h-[180px] lg:w-[452px] md:block"
          />
        </div>
      </div>

      <div className="flex justify-between items-center mx-[30px] mt-[60px] md:mx-[90px] md:mt-[60px] lg:mx-[180px] lg:mt-[90px] md:flex-wrap-reverse lg:flex-nowrap mb-6 md:mb-0">
        <div className="flex flex-col space-y-5 mr-4 mt-5">
          <div className="flex space-x-5">
            <Image
              src={vision1}
              alt="visi"
              className="object-cover hidden h-[178px] w-[216px] md:w-[316px] lg:h-[178px] lg:w-[216px] md:block"
            />

            <Image
              src={vision2}
              alt="visi2"
              className="object-cover hidden h-[178px] w-[216px] md:w-[316px] lg:h-[178px] lg:w-[216px] md:block"
            />
          </div>
          <Image
            src={vision3}
            alt="visi3"
            className="object-cover hidden h-[180px] w-[452px] lg:h-[180px] lg:w-[452px] md:w-[652px] md:h-[200px] md:block"
          />
        </div>
        <div className="h-[220px] w-[460px] md:w-full lg:w-[460px] font-nunito mt-14 md:mt-0 mb-14 md:mb-0">
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

      <div className="relative bg-teamGray h-[1000px] min-h-screen mt-16 w-full ">
        <div className="absolute inset-0 z-10 top-6 sm:top-8 md:top-10 pb-10 max-w-ful mx-auto">
          <div className="z-10 flex-col lg:justify-center lg:items-center">
            <div className="z-10 flex items-center justify-center top-8 left-[40%] ">
              <div className="font-nunito text-4xl font-bold">Meet Our Team</div>
            </div>
            <div className="flex space-x-1 pl-1 pb-5 mx-20 px-2 md:mx-11 lg:mx-40 lg:px-2">
              <div className="font-black text-2xl font-nunito text-terrablue">|</div>
              <div className="font-nunito font-bold text-xl pt-1">Leaders</div>
            </div>

            <div className="grid grid-cols-1 items-center justify-items-center sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 px-40 md:px-10 lg:px-40 gap-y-6 gap-x-6">
              <TeamCard
                src={team1}
                alt="Team Member 1"
                name="Matthews Shimelis"
                role="Product Overseer"
              />
              <TeamCard src={team2} alt="Team Member 2" name="Kojo Manu" role="Tech Lead" />

              <div className="hidden md:block">
                <TeamCard
                  src={team3}
                  alt="Team Member 3"
                  name="Kwabena Smith"
                  role="Marketing Head"
                />
              </div>
              <div className="hidden md:block">
                <TeamCard
                  src={team4}
                  alt="Team Member 4"
                  name="Kweku Brown"
                  role="Backend Engineer"
                />
              </div>
              <div className="hidden md:block">
                <TeamCard src={team5} alt="Team Member 5" name="John Mensah" role="Web Engineer" />
              </div>
              <div className="hidden md:block">
                <TeamCard
                  src={team6}
                  alt="Team Member 6"
                  name="Kofi Lawson"
                  role="Mobile Developer"
                />
              </div>
              <div className="hidden lg:block">
                <TeamCard
                  src={team7}
                  alt="Team Member 7"
                  name="Musa Gambo"
                  role="Finance Manager"
                />
              </div>
              <div className="hidden lg:block">
                <TeamCard
                  src={team8}
                  alt="Team Member 8"
                  name="Simon Quaye"
                  role="Human Resource Manager"
                />
              </div>
            </div>

            <div className="flex justify-center items-center mt-14  mb-5">
              <button className="flex justify-center items-center w-40 h-10 hover:bg-terrablue hover:text-white rounded-full font-nunito text-terrablue outline outline-terrablue outline-1 transition duration-300 ease-in-out">
                View Full Team
              </button>
            </div>
          </div>
        </div>

        <div className="absolute z-0 inset-2 top-0 ml-0">
          <Image src={ellipse} alt="ellipse" className="size-52 -ml-5 overflow-hidden" />
        </div>
        <div className="absolute z-0 bottom-16 left-14">
          <Image src={Star} alt="star" className="size-10" />
        </div>
        <div className="absolute z-0 bottom-20 left-60">
          <Image src={Star2} alt="star2" className="size-6" />
        </div>
        <div className="absolute z-0 top-16 right-80 md:right-60">
          <Image src={Star3} alt="star3" className="size-12" />
        </div>
        <div className="absolute z-0 top-20 right-4">
          <Image src={Star4} alt="star4" className="size-8" />
        </div>
        <div className="absolute z-0 bottom-10 -right-0">
          <Image src={Ellipse2} alt="ellipse" className="size-52 overflow-hidden" />
        </div>
      </div>

      <div className="flex flex-col mx-[50px] my-[90px] h-[500px] md:mx-[10px] md:my-[90px] md:h-[1050px] lg:mx-[200px] ">
        <div className="md:mx-24 lg:mx-0 font-nunito font-bold text-3xl md:text-4xl">
          Why Choose Us
        </div>
        <div className="flex flex-wrap lg:flex-nowrap mt-[60px] md:justify-center md:space-x-3">
          <div className="md:w-80 ">
            <Image src={one} alt="one" className="w-56 object-fill -mt-12 md:-mt-0" />
            <div className="md:w-80 lg:w-52 text-xl font-bold font-nunito md:ml-3 lg:ml-11 -mt-12">
              Transparency and Reliability
            </div>
            <div className="w-full md:w-80 lg:w-44 text-base font-nunito mt-2 mb-16 md:mb-0 md:ml-3 lg:ml-11">
              At Terra, we prioritize transparency in all our listings. Our robust verification
              system ensures that all properties are accurately represented, providing our users
              with reliable information they can trust.
            </div>
          </div>

          <div className="md:w-80 ">
            <Image src={two} alt="two" className="w-56 object-fill -mt-12 md:-mt-0" />
            <div className="md:w-80 lg:w-52 text-xl font-bold font-nunito md:ml-3 lg:ml-11 -mt-12 md:-mt-12 sm:-mt-5">
              Tailored Property Listings
            </div>
            <div className="w-full md:w-80 lg:w-44 text-base font-nunito md:ml-3 lg:ml-11 mt-2 mb-16 md:mb-0">
              We understand the unique needs of our target users. Whether you are a student, an NSP,
              or a young professional, Terra offers tailored listings that meet your specific
              requirements, making it easier to find the perfect accommodation.
            </div>
          </div>

          <div className="md:w-80 lg:">
            <Image src={three} alt="three" className="w-56 object-fill -mt-12 md:-mt-0" />
            <div className="md:w-80 lg:w-52 text-xl font-bold font-nunito md:ml-3 lg:ml-11 -mt-12">
              Seamless Communication
            </div>
            <div className="w-full md:w-80 lg:w-44 text-base font-nunito mt-2 md:ml-3 lg:ml-11 mb-16 md:mb-0">
              Our integrated real-time chat feature facilitates direct communication between tenants
              and landlords. This ensures a smooth and efficient rental process, reducing the time
              and effort required to secure a property.
            </div>
          </div>

          <div className="md:w-80 ">
            <Image src={four} alt="four" className="w-56 object-fill -mt-12 md:-mt-0" />
            <div className="md:w-80 lg:w-52 text-xl font-bold font-nunito md:ml-3 lg:ml-11 -mt-12">
              Affordable and Convenient
            </div>
            <div className="w-full md:w-80 lg:w-44 text-base font-nunito mt-2 md:ml-3 lg:ml-11 mb-32">
              Terra is dedicated to providing affordable housing options without compromising on
              quality. Our platform helps users find cost-effective accommodations that are
              conveniently located and suitable for their needs.
            </div>
          </div>
        </div>

        <div className="flex justify-center w-full -mt-20 md:-mt-5 ">
          <Image src={a2sv} alt="a2sv" className="object-fill w-[570px] pb-14" />
        </div>
      </div>
      <div className="mt-[980px] md:mt-3 lg:-mt-36">
        <Footer />
      </div>
    </div>
  );
};

export default MissionSection;
