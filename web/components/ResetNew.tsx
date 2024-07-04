"use client";
import React, { useState } from "react";
import { IoMdEye, IoMdEyeOff } from "react-icons/io";
import SuccessMessage from "./SuccessMessage";
import { useRouter } from "next/navigation";

const ResetNew = () => {
  const [password1, setPassword1] = useState("");
  const [password2, setPassword2] = useState("");
  const [showPassword1, setShowPassword1] = useState(false);
  const [showPassword2, setShowPassword2] = useState(false);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>("");
  const [successMessage, setSuccessMessage] = useState<string>("");
  const router = useRouter();

  const togglePasswordVisibility1 = () => {
    setShowPassword1(true);
    setTimeout(() => setShowPassword1(false), 1000);
  };

  const togglePasswordVisibility2 = () => {
    setShowPassword2(true);
    setTimeout(() => setShowPassword2(false), 1000);
  };

  const handlePasswordReset = () => {
    setLoading(true);
    setError("");
    setSuccessMessage("");

    setTimeout(() => {
      if (password1.length === 0 || password2.length === 0) {
        setError("Passwords cannot be empty.");
        setLoading(false);
      } else if (password1 === password2 && password1.length > 0) {
        setSuccessMessage("Password successfully reset.");
        setLoading(false);

        setTimeout(() => {
          setSuccessMessage("");
          router.push("/");
        }, 1000);
      } else {
        setError("Passwords do not match ");
        setLoading(false);
      }
    }, 1000);
  };

  return (
    <div>
      <div className="w-10/12 md:w-8/12 flex items-center justify-center mx-auto">
        {!error && successMessage && <SuccessMessage message={successMessage}></SuccessMessage>}
        <div>
          <h1 className="my-1 font-medium"> Hint: </h1>
          <p className="font-normal text-sm mb-7">
            Use a memorable detail, like a favorite book, pet&apos;s name, or special date. Include
            symbols and capital letters for security.
          </p>
          <div>
            <p className="mb-2 text-sm">Password</p>

            <div className="relative mb-8 text-sm">
              <input
                className={`border ${error ? "border-red-500" : "border-terragray"} focus:outline-none focus:border-terragray rounded-full py-3 px-6 w-full`}
                type={showPassword1 ? "text" : "password"}
                placeholder="Enter your password"
                value={password1}
                onChange={(e) => setPassword1(e.target.value)}
              />
              {error ? <p className="text-red-500 text-sm mt-1">{error}</p> : <p></p>}
              <button className="absolute top-[25%] right-[5%]" onClick={togglePasswordVisibility1}>
                {showPassword1 ? (
                  <IoMdEyeOff className="size-5 text-terragray" />
                ) : (
                  <IoMdEye className="size-5 text-terragray" />
                )}
              </button>
            </div>
          </div>

          <div>
            <p className="mb-2 text-sm">Confirm password</p>

            <div className="relative text-sm">
              <input
                className={`border ${error ? "border-red-500" : "border-terragray"} focus:outline-none focus:border-terragray rounded-full py-3 px-6 w-full`}
                type={showPassword2 ? "text" : "password"}
                placeholder="Re-enter your password"
                value={password2}
                onChange={(e) => setPassword2(e.target.value)}
              />
              {error ? <p className="text-red-500 text-sm mt-1">{error}</p> : <p></p>}
              <button className="absolute top-[25%] right-[5%]" onClick={togglePasswordVisibility2}>
                {showPassword2 ? (
                  <IoMdEyeOff className="size-5 text-terragray" />
                ) : (
                  <IoMdEye className="size-5 text-terragray" />
                )}
              </button>
            </div>
          </div>

          <button
            className="w-full md:w-6/12 flex justify-center items-center bg-terrablue rounded-full mt-10 py-3 px-6 text-white text-sm"
            type="submit"
            onClick={handlePasswordReset}
          >
            {loading ? (
              <div className="h-6 w-6 border-2 border-t-4 border-t-transparent border-blue-500 rounded-full animate-spin"></div>
            ) : (
              "Set new password"
            )}
          </button>
        </div>
      </div>
    </div>
  );
};

export default ResetNew;
