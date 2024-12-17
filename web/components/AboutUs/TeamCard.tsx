import React from "react";
import Image, { StaticImageData } from "next/image";
import linkedin from "@/public/linkedin.svg";

interface TeamCardProps {
  src: StaticImageData;
  name: string;
  alt: string;
  role: string;
}

const TeamCard: React.FC<TeamCardProps> = ({ src, name, role }) => {
  return (
    <div className="flex md:w-[220px] w-[220px] h-[295px] bg-white rounded-3xl relative overflow-hidden justify-center items-center">
      <Image src={src} alt={name} className="absolute inset-0 w-full h-full object-cover" />

      <div className="details absolute md:w-[190px] w-[190px] h-[46px] bottom-6 justify-center bg-white rounded-xl">
        <div>
          <div className="flex px-2 mt-2 justify-between">
            <div>
              <p className="text-xs font-nunito font-bold">{name}</p>
              <p className="text-[11px] font-nunito">{role}</p>
            </div>
            <div>
              <Image src={linkedin} alt={`${name} LinkedIn`} className="pt-1 size-[27px]" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default TeamCard;
