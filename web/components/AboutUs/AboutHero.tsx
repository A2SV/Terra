import React from "react";
import Image from "next/image";
import aboutpic1 from "@/public/aboutpic1.jpeg";

const AboutHero = () => {
  return (
    <div className="pb-10">
      <div className="relative w-full h-[277px] mt-[88px] bg-slate-400 ">
        <div className="w-full h-full absolute inset-0">
          <Image
            src={aboutpic1}
            alt="aboutpic1"
            className="object-cover overflow-hidden w-full h-full"
          />
        </div>
        <div className="absolute inset-0 w-[250px] h-[190px] mt-[190px] ml-44">
          <div className="text-[60px] font-nunito font-extrabold text-white h-[84px]">Who</div>
          <div className="flex items-center text-[60px] h-[70px] font-nunito font-extrabold text-terrablue">
            We Are
          </div>
        </div>
      </div>
      <div className="mt-[132px] mx-[180px]">
        <article className="font-nunito text-[17px] leading-tight">
          <p>
            Terra is an innovative digital platform meticulously crafted by the talented students of
            the University of Ghana (G4 cohort of A2SV and pioneers of A2SV Ghana), under the
            esteemed auspices of A2SV. Recognizing the myriad challenges faced by individuals
            seeking temporary housing, we embarked on a mission to transform this arduous process
            into a seamless experience. Our platform is meticulously designed to cater to the unique
            requirements of students, National Service Personnel (NSPs), young professionals, and
            temporary workers. By leveraging advanced technology and user-centric design, Terra aims
            to revolutionize the short-term rental market, providing a transparent, reliable, and
            secure marketplace where users can find and rent properties with ease and confidence.
          </p>

          <p className="mt-4 leading-tight">
            At Terra, we are committed to creating a user-friendly environment that not only
            simplifies the search for temporary and permanent accommodations but also ensures the
            safety and satisfaction of our users. Our platform integrates robust verification
            systems to eliminate fraudulent listings and price disparities, fostering a trustworthy
            community for both tenants and landlords, as well as buyers and sellers. Additionally,
            Terra offers tailored listings that match the specific needs of our diverse user base,
            making it easier than ever to find the perfect rental or property to purchase. With
            features such as real-time chat for seamless communication and advanced filters for
            precise search results, Terra stands as a beacon of innovation and reliability in the
            real estate market, dedicated to enhancing the housing and property search experience
            for all its users.
          </p>
        </article>
      </div>
    </div>
  );
};

export default AboutHero;
