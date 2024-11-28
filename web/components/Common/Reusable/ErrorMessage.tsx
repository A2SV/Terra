import Image from "next/image";
import React, { useState } from "react";

interface ErrorMessageProps {
  message: string;
  onClose: () => void;
}

const ErrorMessage: React.FC<ErrorMessageProps> = ({ message, onClose }) => {
  const [isVisible, setIsVisible] = useState(true);

  const handleClose = () => {
    setIsVisible(false);
    setTimeout(onClose, 200);
  };

  return (
    <div
      className={`fixed top-5 right-5 bg-red-100 text-red-700 px-4 py-3 rounded flex items-center shadow-lg z-50 ${isVisible ? "animate-slide-in" : "animate-slide-out"}`}
    >
      <Image
        src="/ErrorIcon.svg"
        width={20}
        height={20}
        className="rounded-lg mr-2"
        alt="error icon"
      />
      <span className="block sm:inline">{message}</span>
      <button
        onClick={handleClose}
        className="ml-4 h-6 w-6 text-red-700 hover:text-red-900 font-bold text-sm border-2 border-red-300 shadow-md rounded flex items-center justify-center p-1"
        aria-label="Dismiss error"
      >
        ✖
      </button>
    </div>
  );
};

export default ErrorMessage;
