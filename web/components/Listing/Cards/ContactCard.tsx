import Image from "next/image";
import Link from "next/link";
import { FC } from "react";
import { RiUserLine } from "react-icons/ri";
import { PiWhatsappLogoLight } from "react-icons/pi";

interface ContactCardProps {
  agentImage: string;
  agentName: string;
  agentListingsUrl: string;
}

const ContactCard: FC<ContactCardProps> = ({ agentImage, agentName, agentListingsUrl }) => {
  return (
    <div className="hidden lg:flex flex-col w-full lg:w-3/12 bg-gray-100 rounded-md p-6 mb-8 shadow-md font-nunito">
      <div className="flex flex-col items-start">
        <div className="flex items-center">
          <Image
            src={agentImage}
            alt={`${agentName}'s Image`}
            className="w-20 h-20 rounded-md"
            width={80}
            height={80}
          />
          <div className="ml-4">
            <div className="flex items-center">
              <RiUserLine size={24} className="mr-2" />
              <p className="text-lg">{agentName}</p>
            </div>
            <Link href={agentListingsUrl} className="text-terrablue text-lg mt-2 block">
              View Listings
            </Link>
          </div>
        </div>
      </div>
      <form className="mt-6">
        <input type="text" placeholder="Name" className="w-full border p-2 rounded-md mb-3" />
        <input type="tel" placeholder="Phone" className="w-full border p-2 rounded-md mb-3" />
        <input type="email" placeholder="Email" className="w-full border p-2 rounded-md mb-3" />
        <textarea
          placeholder="Message"
          className="w-full border p-2 rounded-md mb-3 resize-none"
          rows={9}
          maxLength={250}
        />
        <select className="w-full border p-2 rounded-md mb-3">
          <option>Select Option</option>
          <option>Option 1</option>
          <option>Option 2</option>
        </select>
        <div className="flex items-center mb-3">
          <input type="checkbox" id="terms" className="mr-2" />
          <label htmlFor="terms" className="text-sm">
            By submitting this form I agree to{" "}
            <span>
              <Link href="#" className="text-terrablue">
                Terms of Use
              </Link>
            </span>
          </label>
        </div>
        <div className="flex flex-col space-y-3 w-full">
          <div className="flex gap-3 w-full">
            <button type="submit" className="bg-green-400 text-white px-4 py-2 rounded-md flex-1">
              Send Message
            </button>
            <button
              type="button"
              className="border border-green-400 text-green-400 px-4 py-2 rounded-md flex-1"
            >
              Call
            </button>
          </div>
          <button
            type="button"
            className="flex justify-center items-center border border-green-400 text-green-400 px-4 py-2 rounded-md w-full"
          >
            <PiWhatsappLogoLight size={24} className="mr-2" />
            <p className="text-lg">Whatsapp</p>
          </button>
        </div>
      </form>
    </div>
  );
};

export default ContactCard;
