"use client";

import React, { useState } from "react";
import { env } from "next-runtime-env";
import axios from "axios";
import { useRouter } from "next/navigation";

const ResetInputEmail = () => {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [errorMessage, setErrorMessage] = useState("");

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    handleEmailSubmission();
  };

  const handleEmailSubmission = async () => {
    const baseUrl = env("NEXT_PUBLIC_BASE_URL");
    try {
      await axios
        .post(`${baseUrl}Auth/forgot-password`, { email })
        .then((response) => {
          if (response.status === 200) {
            router.push(`/otp`);
          }
        })
        .catch((error: any) => {
          if (error?.response?.data?.data?.length > 0) {
            setErrorMessage(error?.response?.data?.data);
          } else {
            alert("An error occurred. Please try again.");
          }
        });
    } catch (error) {
      alert("An error occurred. Please try again.");
    }
  };

  return (
    <div className="w-10/12 md:w-8/12 flex flex-col items-center justify-center mx-auto">
      <div className="flex justify-center items-center p-3 px-2 w-full text-md font-normal font-nunito">
        Enter your email address, you will receive a link in your email to create a new password
      </div>

      <div className="p-3 w-full">
        <form onSubmit={handleSubmit}>
          <span className="text-md font-normal font-nunito">Email Address</span>
          {errorMessage.length > 0 ? (
            <p className=" text-red-500 text-xs font-montserrat">{errorMessage}</p>
          ) : null}
          <div className="pt-2">
            <label>
              <input
                type="email"
                value={email}
                placeholder="Email Address"
                onChange={(e) => setEmail(e.target.value)}
                required
                className="font-nunito rounded-3xl w-full h-12 border border-terragray px-3 py-2 focus:outline-none focus:border-terrablue"
              />
            </label>
          </div>
          <div className="pt-9 text-sm font-sans">
            <button
              type="submit"
              className="rounded-3xl bg-terrablue w-36 h-12 text-white hover:bg-blue-800 font-sans"
            >
              Continue
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default ResetInputEmail;
