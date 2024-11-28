import React from "react";
import Image from "next/image";

interface ErrorMessageProps {
  message: string;
  onClose: () => void;
}

const ErrorMessage: React.FC<ErrorMessageProps> = ({ message, onClose }) => {
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
      <button
        onClick={onClose}
        className="ml-4 text-red-700 hover:text-red-900 font-bold"
        aria-label="Dismiss error"
      >
        ✖
      </button>
    </div>
  );
};

export default ErrorMessage;
