"use client";

import React, { useState, useEffect, ChangeEvent, FormEvent } from "react";
import { FcGoogle } from "react-icons/fc";
import axios from "axios";
import { env } from "next-runtime-env";
import { signIn } from "next-auth/react";
import ErrorMessage from "../Common/Reusable/ErrorMessage";
import SuccessMessage from "../Common/Reusable/SuccessMessage";
import AuthButton from "../Common/Auth/AuthButton";
import { useRouter } from "next/navigation";

const SignUpCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [confirmPasswordVisible, setConfirmPasswordVisible] = useState<boolean>(false);

  const [email, setEmail] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [confirmPassword, setConfirmPassword] = useState<string>("");
  const [passwordError, setPasswordError] = useState<string>("");
  const [message, setMessage] = useState("");
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState<boolean>(false);
  const [isButtonDisabled, setIsButtonDisabled] = useState<boolean>(true);
  const router = useRouter();

  const [user, setUser] = useState({
    firstName: "",
    lastName: "",
    email: "",
    password: "",
    phoneNumber: "0500000000",
    role: "user",
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

  useEffect(() => {
    const isPasswordValid = password.length > 0;
    const isNameValid = user.firstName !== "" && user.lastName !== "";
    const isEmailValid = emailError === "";

    setIsButtonDisabled(!(isEmailValid && isPasswordValid && isNameValid));
  }, [password, confirmPassword, user.firstName, user.lastName, emailError]);

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);

    if (password !== confirmPassword) {
      setPasswordError("Passwords do not match");
    } else {
      setPasswordError("");

      try {
        const baseUrl = env("NEXT_PUBLIC_BASE_URL") + "auth/register";
        const res = await axios.post(baseUrl, user);
        setSuccess(res.data.message);

        // Navigate to the OTP verification page with the user's email
        router.push(`/otp/${user.email}`);
      } catch (error) {
        if (axios.isAxiosError(error)) {
          if (error.response?.data.errors) {
            setPasswordError(
              "Passwords must have at least one non alphanumeric character and a minimum length of 10 characters"
            );

            setTimeout(() => {
              setPasswordError("");
            }, 5000);
          } else if (error.response?.data.message) {
            setMessage(error.response?.data.message);
            setTimeout(() => {
              setMessage("");
            }, 10000);
          }
        } else {
          setMessage("An error occurred. Please try again later.");
          setTimeout(() => {
            setMessage("");
          }, 10000);
        }
      }
    }

    setLoading(false);
  };

  return (
    <div className="flex justify-center items-center ">
      {!passwordError && message && (
        <ErrorMessage message={message} onClose={() => setMessage("")}></ErrorMessage>
      )}
      {!passwordError && !message && success && <SuccessMessage message={success}></SuccessMessage>}

      <div className="bg-white w-full flex flex-col items-center justify-center ">
        <form
          onSubmit={handleSubmit}
          className="w-5/6 md:w-4/6 lg:w-3/6 flex flex-col justify-center items-center  space-y-3  "
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
              className={`h-5     w-full md:w-12/12 py-4 font-light font-nunito text-sm rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3`}
              type="text"
              required
              placeholder="John  "
              onChange={handleFirstNameChange}
            />
          </div>

          <div className="details w-full">
            <p className="font-nunito  font-normal text-sm mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Last name
            </p>
            <input
              className={`h-5 w-full md:w-12/12 py-4 font-nunito font-light text-sm  rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3`}
              type="text"
              required
              placeholder="Doe"
              onChange={handleLastNameChange}
            />
          </div>

          <div className="details w-full">
            <p className="font-nunito font-normal text-sm mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Email Address
            </p>
            <input
              className={`h-5 w-full md:w-12/12 text-sm   py-4 font-nunito font-light rounded-full border ${
                emailError ? "border-red-500" : "border-terragray"
              } focus:outline-none focus:border-terrablue px-3`}
              type="email"
              required
              placeholder="john@gmail.com"
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
                className="h-5 w-full md:w-12/12 text-sm py-4 font-nunito font-light rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3 pr-6"
                type={passwordVisible ? "text" : "password"}
                required
                value={password}
                onChange={handlePasswordChange}
              />
              <img
                src={passwordVisible ? "/eye-on.svg" : "/eye-off.svg"}
                alt="Toggle Password Visibility"
                className="absolute top-1/2 right-3 transform -translate-y-1/2 cursor-pointer h-5 w-5"
                onClick={() => setPasswordVisible(!passwordVisible)}
              />
            </div>
          </div>

          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Confirm Password
            </p>
            <div className="relative w-full">
              <input
                className="h-5 w-full md:w-12/12 text-sm py-4 font-nunito font-light rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3 pr-6"
                type={confirmPasswordVisible ? "text" : "password"}
                required
                value={confirmPassword}
                onChange={handleConfirmPasswordChange}
              />
              <img
                src={confirmPasswordVisible ? "/eye-on.svg" : "/eye-off.svg"}
                alt="Toggle Password Visibility"
                className="absolute top-1/2 right-3 transform -translate-y-1/2 cursor-pointer h-5 w-5"
                onClick={() => setConfirmPasswordVisible(!confirmPasswordVisible)}
              />
            </div>
            {passwordError && (
              <p className="text-red-500 font-nunito text-sm mt-1">{passwordError}</p>
            )}
          </div>

          <div className="lower-section font-nunito w-full flex flex-col items-center text-sm space-y-1 ">
            <AuthButton
              loading={loading}
              isButtonDisabled={isButtonDisabled}
              text="Register"
              action={handleSubmit}
            />
            <p className="font-sans font-normal text-sm">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-6/12 h-10 rounded-full flex items-center justify-center border border-terragray"
              onClick={() => {
                signIn("google");
              }}
            >
              <FcGoogle className="text-2xl mr-2" />
              <p className="font-nunito font-normal text-[12px] ">Continue with Google</p>
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default SignUpCard;
