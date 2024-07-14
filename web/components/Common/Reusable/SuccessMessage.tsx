import React from "react";
import Image from "next/image";

interface SuccessMessageProps {
  message: string;
}

const SuccessMessage: React.FC<SuccessMessageProps> = ({ message }) => {
  return (
    <div className="fixed top-5 right-5 bg-green-100 text-green-700 px-4 py-3 rounded flex items-center shadow-lg animate-slide-in z-50">
      <Image
        src="/SuccessIcon.svg"
        width={20}
        height={20}
        className="rounded-lg mr-2"
        alt="error icon"
      />
      <span className="block sm:inline">{message}</span>
    </div>
  );
};

export default SuccessMessage;
