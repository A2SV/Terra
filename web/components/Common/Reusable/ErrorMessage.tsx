import React from "react";
import Image from "next/image";

interface ErrorMessageProps {
  message: string;
}

const ErrorMessage: React.FC<ErrorMessageProps> = ({ message }) => {
  return (
    <div className="fixed top-5 right-5 bg-red-100 text-red-700 px-4 py-3 rounded flex items-center shadow-lg animate-slide-in z-50">
      <Image
        src="/ErrorIcon.svg"
        width={20}
        height={20}
        className="rounded-lg mr-2"
        alt="error icon"
      />
      <span className="block sm:inline">{message}</span>
    </div>
  );
};

export default ErrorMessage;
