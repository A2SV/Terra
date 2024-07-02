"use client";

import React, { useState, ChangeEvent, FormEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { FcGoogle } from "react-icons/fc";
import axios from "axios";
import { useRouter } from "next/navigation";
import { env } from "next-runtime-env";
import Image from "next/image";
import { signIn } from "next-auth/react";

const SignUpCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [email, setEmail] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [confirmPassword, setConfirmPassword] = useState<string>("");
  const [passwordError, setPasswordError] = useState<string>("");
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState<boolean>(false);
  const router = useRouter();

  const [user, setUser] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: "",
  });

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

  const togglePasswordVisibility = (): void => {
    setPasswordVisible(!passwordVisible);
    if (!passwordVisible) {
      setTimeout(() => {
        setPasswordVisible(false);
      }, 700);
    }
  };

  const handleEmailChange = (e: ChangeEvent<HTMLInputElement>): void => {
    const { value } = e.target;
    setEmail(value);

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(value)) {
      setEmailError("Invalid email address");
    } else {
      setEmailError("");
    }

    setUser((prevUser) => ({
      ...prevUser,
      email: e.target.value,
    }));
  };

  const handlePasswordChange = (e: ChangeEvent<HTMLInputElement>): void => {
    setPassword(e.target.value);
    setUser((prevUser) => ({
      ...prevUser,
      password: e.target.value,
    }));
  };

  const handleConfirmPasswordChange = (event: ChangeEvent<HTMLInputElement>): void => {
    setConfirmPassword(event.target.value);
  };

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);

    if (password !== confirmPassword) {
      setPasswordError("Passwords do not match");
    } else {
      setPasswordError("");
    }

    try {
      const baseUrl = env("NEXT_PUBLIC_BASE_URL") + "UserAccount/register";
      await axios.post(baseUrl, user);

      router.push("/");
    } catch (error) {
      if (axios.isAxiosError(error)) {
        setMessage(error.response?.data);
      } else {
        setMessage("An error occurred. Please try again later.");
      }
    }

    setLoading(false);
  };

  return (
    <div className="body bg-gray-400 lg:flex">
      <div className="body-left  bg-zinc-800 lg:w-1/2"> </div>
      <div className="body-right bg-white w-screen lg:w-1/2 flex flex-col items-center justify-center">
        <form
          onSubmit={handleSubmit}
          className="info-section mt-20 max-w-lg mb-10  w-4/6 flex flex-col items-center space-y-6"
        >
          <div className="nav w-full md:w-2/4 h-12 bg-terrapurple flex items-center rounded-full justify-between px-5 ">
            <button
              type="button"
              className="login  w-1/2 h-2/3 rounded-full flex justify-center items-center"
            >
              <p className="text-terrablue text-sm ">Login</p>
            </button>
            <button
              type="button"
              className="register w-1/2 h-2/3 bg-terrablue rounded-full flex justify-center items-center"
            >
              <p className="text-white text-sm ">Register</p>
            </button>
          </div>

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

          <div className="info w-full">
            <p className="font-sans text-sm font-light">
              Enter your details and join the Terra family today
            </p>
          </div>

          <div className="details w-full">
            <p className="font-sans text-sm  font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              First name
            </p>
            <input
              className={`h-10 w-5/6 py-4 font-light text-sm  rounded-full border border-terraGray px-3`}
              type="text"
              required
              placeholder="Enter your User name"
              onChange={handleFirstNameChange}
            />
          </div>

          <div className="details w-full">
            <p className="font-sans text-sm font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Last name
            </p>
            <input
              className={`h-10 w-5/6 py-4 font-light text-sm  rounded-full border border-terraGray px-3`}
              type="text"
              required
              placeholder="Enter your User name"
              onChange={handleLastNameChange}
            />
          </div>

          <div className="details w-full">
            <p className="font-sans text-sm  font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Email Address
            </p>
            <input
              className={`h-10 w-5/6 text-sm  py-4 font-light rounded-full border ${
                emailError ? "border-red-500" : "border-terraGray"
              } px-3`}
              type="email"
              required
              placeholder="Enter your Email Address"
              value={email}
              onChange={handleEmailChange}
            />
            {emailError && <p className="text-red-500 text-sm mt-1">{emailError}</p>}
          </div>
          <div className="details w-full">
            <p className="font-sans text-sm font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Password
            </p>
            <div className="w-full relative">
              <input
                className="h-10 w-5/6 text-sm py-4 font-light rounded-full border border-terraGray px-3 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Enter your Password"
                value={password}
                onChange={handlePasswordChange}
              />
              <span
                className="absolute text-sm  top-1/2 right-20 sm:right-24 transform -translate-y-1/2 cursor-pointer text-eye"
                role="button"
                aria-label={passwordVisible ? "Hide password" : "Show password"}
                onClick={togglePasswordVisibility}
              >
                {passwordVisible ? <IoEyeOff /> : <IoEye />}
              </span>
            </div>
          </div>
          <div className="details w-full">
            <p className="font-sans text-sm  font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Confirm Password
            </p>
            <div className="relative w-full">
              <input
                className="h-10 w-5/6 text-sm py-4 font-light rounded-full border border-terraGray px-3 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Renter your Password"
                value={confirmPassword}
                onChange={handleConfirmPasswordChange}
              />
              <span
                className="absolute top-1/2 right-20 sm:right-24 text-sm transform -translate-y-1/2 cursor-pointer text-eye"
                role="button"
                aria-label={passwordVisible ? "Hide password" : "Show password"}
                onClick={togglePasswordVisibility}
              >
                {passwordVisible ? <IoEyeOff /> : <IoEye />}
              </span>
            </div>
            {passwordError && <p className="text-red-500 text-sm mt-1">{passwordError}</p>}
          </div>

          <div className="lower-section w-full flex flex-col items-center space-y-3">
            <div className="login-btn w-2/5 text-sm ">
              <button
                type="submit"
                className="w-full h-9 bg-terrablue rounded-full text-white text-xs"
              >
                {loading ? "Loading..." : "Register"}
              </button>
            </div>

            <p className="font-sans font-light text-sm  -my-">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-3/6 h-9 text-sm  rounded-full flex items-center justify-center border border-terraGray"
              onClick={() => {
                signIn("google");
              }}
            >
              <FcGoogle className="text-2xl mr-2" />
              <p className="font-sans font-light text-xs ">Continue with Google</p>
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default SignUpCard;
