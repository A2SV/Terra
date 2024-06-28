"use client";
import React, { useState, FormEvent, ChangeEvent } from "react";
import axios from "axios";
import { useRouter } from "next/navigation";
import { env } from "next-runtime-env";
import Image from "next/image";

export default function SignupCard() {
  const [user, setUser] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: "",
  });

  const router = useRouter();

  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState<boolean>(false);

  const handleFirstNameChange = (e: ChangeEvent<HTMLInputElement>) => {
    setUser((prevUser) => ({
      ...prevUser,
      firstName: e.target.value,
    }));
  };

  const handleLastNameChange = (e: ChangeEvent<HTMLInputElement>) => {
    setUser((prevUser) => ({
      ...prevUser,
      lastName: e.target.value,
    }));
  };

  const handleEmailChange = (e: ChangeEvent<HTMLInputElement>) => {
    setUser((prevUser) => ({
      ...prevUser,
      email: e.target.value,
    }));
  };

  const handlePasswordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setUser((prevUser) => ({
      ...prevUser,
      password: e.target.value,
    }));
  };

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    try {
      const baseUrl = env("NEXT_PUBLIC_BASE_URL") + "UserAccount/register";
      await axios.post(baseUrl, user);

      router.push("/");
    } catch (error) {
      if (axios.isAxiosError(error)) {
        console.error("Response:", error.response);
        console.error("Data:", error.response?.data);
        console.error("Status:", error.response?.status);
        setMessage(error.response?.data);
      } else {
        setMessage("An error occurred. Please try again later.");
      }
    }
    setLoading(false);
  };

  return (
    <div className="h-[600px] w-full flex items-center justify-center ">
      <div className="w-full ml-[30px] mr-[30px]   md:w-2/4 h-[500px] rounded-xl px-10 py-10 bg-white">
        <h2 className="text-2xl text-text font-bold mb-3 text-left font-pops">Sign up</h2>

        {message && (
          <div
            className="flex items-center bg-red-100 text-red-700 px-4 py-3 rounded relative"
            role="alert"
          >
            <Image
              src="/ErrorIcon.svg"
              width={20}
              height={20}
              className="rounded-lg mr-2"
              alt="avatar"
            />
            <span className="block sm:inline">{message}</span>
          </div>
        )}

        <p className="text-sm text-text font-pops mb-2 font-light pt-[16px] pb-[16px]">
          Hey, Enter your details to sign up{" "}
        </p>
        <form onSubmit={handleSubmit}>
          <div className="font-pops flex flex-row">
            <input
              type="text"
              id="first-name"
              className="w-full px-3 py-2  bg-input text-sm mb-4 rounded-md focus:outline-none focus:border-blue-500"
              value={user.firstName}
              onChange={handleFirstNameChange}
              placeholder="First Name"
              required
            />
          </div>
          <div className="font-pops flex flex-row">
            <input
              type="text"
              id="last-name"
              className="w-full px-3 py-2  bg-input text-sm mb-4 rounded-md focus:outline-none focus:border-blue-500"
              value={user.lastName}
              onChange={handleLastNameChange}
              placeholder="Last Name"
              required
            />
          </div>
          <div className="mb-4 font-pops">
            <input
              type="email"
              id="email"
              className="w-full px-3 py-2 bg-input text-sm mb-4 rounded-md focus:outline-none focus:border-blue-500"
              value={user.email}
              onChange={handleEmailChange}
              placeholder="Email address"
              required
            />
          </div>
          <div className="relative mb-4 font-pops flex flex-row">
            <input
              type="password"
              id="password"
              className="w-full px-3 py-2  bg-input text-sm rounded-md focus:outline-none focus:border-blue-500 mb-7"
              value={user.password}
              onChange={handlePasswordChange}
              placeholder="Password"
              required
            />
          </div>
          <button
            type="submit"
            className="w-full bg-primary text-white font-semibold text-sm py-2 font-pops rounded-md hover:bg-blue-600 transition duration-300"
          >
            {loading ? "Loading..." : "Sign up"}
          </button>
        </form>
      </div>
    </div>
  );
}
