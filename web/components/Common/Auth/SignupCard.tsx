"use client";

import React, { useState, ChangeEvent, FormEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { FcGoogle } from "react-icons/fc";
import axios from "axios";
import { useRouter } from "next/navigation";
import { env } from "next-runtime-env";
import { signIn } from "next-auth/react";
import ErrorMessage from "../Reusable/ErrorMessage";
import AuthButton from "./AuthButtons";

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

        setTimeout(() => {
          setMessage("");
        }, 5000);
      } else {
        setMessage("An error occurred. Please try again later.");
        setTimeout(() => {
          setMessage("");
        }, 5000);
      }
    }

    setLoading(false);
  };

  return (
    <div className="">
      {!passwordError && message && <ErrorMessage message={message}></ErrorMessage>}

      <div className="bg-white w-full flex flex-col items-center justify-center">
        <form
          onSubmit={handleSubmit}
          className="w-5/6 md:w-4/6 flex flex-col items-center space-y-3"
        >
          <div className="w-full">
            <p className="font-nunito text-sm font-normal">
              Enter your details and join the Terra family today
            </p>
          </div>

          <div className="w-full">
            <p className="font-nunito text-sm font-normal mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              First name
            </p>
            <input
              className={`h-5 w-full py-4 font-light font-nunito text-sm rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3`}
              type="text"
              required
              placeholder="Enter Your First Name"
              onChange={handleFirstNameChange}
            />
          </div>

          <div className="details w-full">
            <p className="font-nunito  font-normal text-sm mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Last name
            </p>
            <input
              className={`h-5 w-full py-4 font-nunito font-light text-sm  rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3`}
              type="text"
              required
              placeholder="Enter Your Last Name"
              onChange={handleLastNameChange}
            />
          </div>

          <div className="details w-full">
            <p className="font-nunito font-normal text-sm mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Email Address
            </p>
            <input
              className={`h-5 w-full text-sm   py-4 font-nunito font-light rounded-full border ${
                emailError ? "border-red-500" : "border-terragray"
              } focus:outline-none focus:border-terrablue px-3`}
              type="email"
              required
              placeholder="Enter Your Email Address"
              value={email}
              onChange={handleEmailChange}
            />
            {emailError && <p className="text-red-500 font-nunito text-sm  mt-1">{emailError}</p>}
          </div>
          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Password
            </p>
            <div className="w-full relative">
              <input
                className="h-5 w-full text-sm py-4 font-nunito font-light rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Enter Your Password"
                value={password}
                onChange={handlePasswordChange}
              />
              <span
                className="absolute font-nunito top-1/2 right-4 transform -translate-y-1/2 cursor-pointer text-sm text-eye"
                role="button"
                aria-label={passwordVisible ? "Hide password" : "Show password"}
                onClick={togglePasswordVisibility}
              >
                {passwordVisible ? <IoEyeOff /> : <IoEye />}
              </span>
            </div>
          </div>
          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Confirm Password
            </p>
            <div className="relative w-full">
              <input
                className="h-5 w-full text-sm py-4 font-nunito font-light rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Renter Your Password"
                value={confirmPassword}
                onChange={handleConfirmPasswordChange}
              />
              <span
                className="absolute font-nunito top-1/2 right-4 text-sm  transform -translate-y-1/2 cursor-pointer text-eye"
                role="button"
                aria-label={passwordVisible ? "Hide password" : "Show password"}
                onClick={togglePasswordVisibility}
              >
                {passwordVisible ? <IoEyeOff /> : <IoEye />}
              </span>
            </div>
            {passwordError && (
              <p className="text-red-500 font-nunito text-sm  mt-1">{passwordError}</p>
            )}
          </div>

          <div className="lower-section font-nunito w-full flex flex-col items-center text-sm space-y-3">
            <AuthButton loading={loading} text="Login" action={handleSubmit} />
            <p className="font-sans font-normal text-sm">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-5/12 h-10 rounded-full flex items-center justify-center border border-terragray"
              onClick={() => {
                signIn("google");
              }}
            >
              <FcGoogle className="text-2xl mr-2" />
              <p className="font-nunito font-normal text-xs ">Continue with Google</p>
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default SignUpCard;