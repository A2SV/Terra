"use client";

import React, { useState, FormEvent, ChangeEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { useRouter } from "next/navigation";
import Image from "next/image";
import ErrorIcon from "@/public/ErrorIcon.svg";
import { signIn } from "next-auth/react";

export default function LoginCard() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [loading, setLoading] = useState<boolean>(false);
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      const response = await signIn("credentials", {
        redirect: false,
        email,
        password,
      });

      if (response?.error) {
        setError(response.error);
        setLoading(false);
        console.error(response.error);
      } else {
        router.push("/");
      }
    } catch (error) {
      setError("An error occurred. Please try again.");
      setLoading(false);
    }
  };
  const handleEmailChange = (e: ChangeEvent<HTMLInputElement>) => {
    setEmail(e.target.value);
  };

  const handlePasswordChange = (e: ChangeEvent<HTMLInputElement>) => {
    setPassword(e.target.value);
  };

  const togglePasswordVisibility = () => {
    setPasswordVisible(!passwordVisible);
    if (!passwordVisible) {
      setTimeout(() => {
        setPasswordVisible(false);
      }, 700);
    }
  };

  return (
    <div className="h-[650px] w-full flex items-center justify-center">
      <div className="w-full ml-[30px] mr-[30px] bg-white md:w-2/4 h-[480px] rounded-xl px-10 py-10">
        <h2 className="text-2xl text-text font-bold mb-6 text-left font-pops">Login</h2>
        {error && (
          <div
            className="flex items-center bg-red-100 borde text-sm text-text font-pops font-medium px-4 py-3 rounded relative"
            role="alert"
          >
            <Image className="mr-4" src={ErrorIcon} alt="single blog" />
            <span className="block sm:inline">{error}</span>
          </div>
        )}
        {error ? (
          <p className="text-sm text-text font-pops font-light my-6">
            {" "}
            Hey, Enter your details to sign in to your account{" "}
          </p>
        ) : (
          <p className="text-sm text-text font-pops font-light my-10">
            Hey, Enter your details to sign in to your account{" "}
          </p>
        )}
        <form onSubmit={handleSubmit}>
          <div className="mb-4 font-pops">
            <input
              type="email"
              id="email"
              className="w-full px-3 py-2 bg-input text-sm rounded-md focus:outline-none focus:border-blue-500"
              value={email}
              onChange={handleEmailChange}
              placeholder="Email address"
              required
            />
          </div>
          <div className="relative mb-6 font-pops flex flex-row">
            <input
              type={passwordVisible ? "text" : "password"}
              id="password"
              className="w-full px-3 py-2 bg-input text-sm rounded-md focus:outline-none focus:border-blue-500 mb-7"
              value={password}
              onChange={handlePasswordChange}
              placeholder="Password"
              required
            />
            <span
              className="absolute right-3 top-5 transform -translate-y-1/2 cursor-pointer text-eye"
              role="button"
              aria-label={passwordVisible ? "Hide password" : "Show password"}
              onClick={togglePasswordVisibility}
            >
              {passwordVisible ? <IoEyeOff /> : <IoEye />}
            </span>
          </div>

          <button
            type="submit"
            className="w-full bg-btn text-white font-semibold text-sm py-2 font-pops rounded-md hover:bg-blue-600 transition duration-300"
            disabled={loading}
          >
            {loading ? "Loading..." : "Sign in"}
          </button>
        </form>
        <button
          className="w-full bg-btn text-white font-semibold text-sm py-2 font-pops mt-4 rounded-md hover:bg-blue-600 transition duration-300"
          onClick={() => {
            signIn("google");
          }}
        >
          Google
        </button>
      </div>
    </div>
  );
}
