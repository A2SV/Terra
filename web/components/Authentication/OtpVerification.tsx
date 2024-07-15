"use client";

import React, { useState } from "react";
import Image from "next/image";
import OtpInput from "react-otp-input";
import axios from "axios";
import { env } from "next-runtime-env";
import { useRouter } from "next/navigation";

interface OtpVerificationProps {
  email: string;
}

const OtpVerification: React.FC<OtpVerificationProps> = ({ email }) => {
  const [otp, setOtp] = useState<string>("");
  const baseUrl = env("NEXT_PUBLIC_BASE_URL");
  const router = useRouter();

  const handleSubmit = async () => {
    try {
      console.log("OTP: ", otp);
      console.log("Email: ", email);
      const response = await axios.post(baseUrl + "Auth/VerifyOTP", {
        otp,
        email,
      });
      if (response.status === 200) {
        console.log("OTP Verified");
        router.push(`/reset/${email}`);
      }
    } catch (error) {
      console.log(error);
    }
  };

  const handleReset = () => {
    try {
      console.log("Email: ", email);
      axios.post(baseUrl + "Auth/ResendOTP", {
        email,
      });
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <div className="px-[40px] h-screen bg-pageColor">
        <div className="flex md:flex-row flex-col justify-between">
          <div className="h-screen w-screen flex items-center justify-center">
            <div className=" flex flex-col items-center justify-center">
              <Image src="/logo.svg" alt="logo" width={124} height={180} />
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
                  Didn&apos;t receive OTP? <span className="text-btnColor underline">Resend</span>
                </p>
              </div>
              <button
                onClick={handleSubmit}
                className="bg-btnColor text-btnTextColor px-12 py-3 rounded-[24px]"
              >
                Submit
              </button>
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
