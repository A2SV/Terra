"use client";

import React, { FormEvent, useState } from "react";
import Image from "next/image";
import OtpInput from "react-otp-input";
import axios from "axios";
import { env } from "next-runtime-env";
import { useRouter } from "next/navigation";
import ErrorMessage from "../Common/Reusable/ErrorMessage";
import AuthButton from "../Common/Auth/AuthButton";

interface OtpVerificationProps {
  email: string;
}

const OtpVerification: React.FC<OtpVerificationProps> = ({ email }) => {
  const [otp, setOtp] = useState<string>("");
  const [message, setMessage] = useState<string>("");
  const [loading, setLoading] = useState<boolean>(false);

  const baseUrl = env("NEXT_PUBLIC_BASE_URL");
  const router = useRouter();

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);

    try {
      const response = await axios.post(baseUrl + "Auth/VerifyOTP", {
        otp,
        email,
      });
      if (response.status === 200) {
        router.push(`/auth`);
      }
    } catch (error) {
      if (axios.isAxiosError(error)) {
        const errorMessage = error.response?.data?.message || "An unknown error occurred.";
        setMessage(errorMessage);
        setTimeout(() => {
          setMessage("");
        }, 10000);
      } else {
        setMessage("An error occurred. Please try again later.");
        setTimeout(() => {
          setMessage("");
        }, 10000);
      }
    }

    setLoading(false);
  };

  const handleReset = () => {
    try {
      axios.post(baseUrl + "Auth/ResendOTP", {
        email,
      });
    } catch (error) {
      if (axios.isAxiosError(error)) {
        const errorMessage = error.response?.data?.message || "An unknown error occurred.";
        setMessage(errorMessage);
      } else {
        setMessage("An error occurred. Please try again later.");
      }
    }
  };

  return (
    <>
      <div className="px-[40px] h-screen bg-pageColor">
        <div className="flex md:flex-row flex-col justify-between">
          <div className="h-screen w-screen flex items-center justify-center">
            <div className=" flex flex-col items-center justify-center">
              <Image src="/logo.svg" alt="logo" width={124} height={180} />
              {message && <ErrorMessage message={message} onClose={() => setMessage("")} />}
              <h1 className="text-4xl font-bold text-btnColor mt-[20px]">OTP Verification</h1>

              <p className="text-normalTextColor text-[16px] pt-[40px] pb-[30px]">
                Please enter the OTP sent to your email
              </p>
              <OtpInput
                value={otp}
                onChange={setOtp}
                inputStyle={{
                  width: "50px",
                  height: "42px",
                  borderRadius: "10px",
                  margin: "12px",
                  color: "black",
                }}
                numInputs={6}
                shouldAutoFocus={true}
                renderSeparator={<span className="mx-[1px]"> </span>}
                renderInput={(props) => (
                  <input
                    {...props}
                    type="password"
                    className="bg-inputColor outline-[0.9px] outline-[#0000001A] text-[14px]"
                  />
                )}
              />
              <div className="pt-7 pb-10">
                <p className="text-[#3A3A3A80]" onClick={handleReset}>
                  Didn&apos;t receive OTP?{" "}
                  <span className="text-btnColor underline hover:cursor-pointer">Resend</span>
                </p>
              </div>
              <AuthButton
                loading={loading}
                isButtonDisabled={false}
                text="Submit"
                action={handleSubmit}
              />
            </div>
          </div>

          <div className="h-screen w-screen hidden md:flex ">
            <div className="flex justify-center items-center ">
              <Image src="/otp.svg" alt="otp_image" width={630} height={630} />
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default OtpVerification;
