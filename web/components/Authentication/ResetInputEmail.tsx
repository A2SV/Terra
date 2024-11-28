"use client";

import React, { ChangeEvent, useState } from "react";
import { env } from "next-runtime-env";
import axios from "axios";
import { useRouter } from "next/navigation";
import AuthButton from "../Common/Auth/AuthButton";
import ErrorMessage from "../Common/Reusable/ErrorMessage";

const ResetInputEmail = () => {
  const router = useRouter();
  const [loading, setLoading] = useState<boolean>(false);
  const [email, setEmail] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [emailError, setEmailError] = useState<string>("");

  const handleEmailChange = (event: ChangeEvent<HTMLInputElement>): void => {
    const { value } = event.target;
    setEmail(value);

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(value)) {
      setEmailError("Invalid email address");
    } else {
      setEmailError("");
    }
  };

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    setLoading(true);
    event.preventDefault();
    handleEmailSubmission();
  };

  const handleEmailSubmission = async () => {
    const baseUrl = env("NEXT_PUBLIC_BASE_URL");
    try {
      const res = await axios.post(`${baseUrl}Auth/forgot-password`, { email });

      if (res.status === 200) {
        const token = res.data.token;
        router.push(`/reset-password/${token}/${email}`);
      }
    } catch (error: any) {
      if (error.response?.data?.message) {
        setErrorMessage(error.response.data.message);
      } else {
        setErrorMessage("An error occurred. Please try again.");
      }

      setTimeout(() => {
        setErrorMessage("");
      }, 10000);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="w-10/12 md:w-8/12 flex flex-col items-center justify-center mx-auto">
      {errorMessage && (
        <ErrorMessage message={errorMessage} onClose={() => setErrorMessage("")}></ErrorMessage>
      )}
      <div className="flex justify-center items-center p-3 px-2 w-full text-md font-normal font-nunito">
        Enter your email address, you will receive a link in your email to create a new password
      </div>

      <div className="p-3 w-full">
        <form onSubmit={handleSubmit}>
          <span className="text-md font-normal font-nunito">Email Address</span>
          <div className="pt-4">
            <label>
              <input
                type="email"
                value={email}
                placeholder="Email Address"
                onChange={handleEmailChange}
                required
                className="font-nunito rounded-3xl w-full h-10 border border-terragray px-3 py-2 text-sm focus:outline-none focus:border-terrablue"
              />
            </label>
            {emailError && <p className="text-red-500 font-nunito text-sm mt-1">{emailError}</p>}
          </div>
          <div className="flex justify-center items-center pt-9 text-sm font-sans">
            <AuthButton
              loading={loading}
              isButtonDisabled={false}
              text="Continue"
              action={handleSubmit}
            />
          </div>
        </form>
      </div>
    </div>
  );
};

export default ResetInputEmail;
