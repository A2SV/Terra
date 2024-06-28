"use client";

import React, { useState, ChangeEvent, FormEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { FcGoogle } from "react-icons/fc";

const SignUpCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [email, setEmail] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [confirmPassword, setConfirmPassword] = useState<string>("");
  const [passwordError, setPasswordError] = useState<string>("");

  const togglePasswordVisibility = (): void => {
    setPasswordVisible(!passwordVisible);
    if (!passwordVisible) {
      setTimeout(() => {
        setPasswordVisible(false);
      }, 700);
    }
  };

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

  const handlePasswordChange = (event: ChangeEvent<HTMLInputElement>): void => {
    setPassword(event.target.value);
  };

  const handleConfirmPasswordChange = (event: ChangeEvent<HTMLInputElement>): void => {
    setConfirmPassword(event.target.value);
  };

  const handleSubmit = (event: FormEvent<HTMLFormElement>): void => {
    event.preventDefault();
    if (password !== confirmPassword) {
      setPasswordError("Passwords do not match");
    } else {
      setPasswordError("");
    }
  };

  return (
    <div className="body bg-gray-400 lg:flex">
      <div className="body-left  bg-zinc-800 lg:w-1/2"></div>
      <div className="body-right bg-white w-screen lg:w-1/2 flex flex-col items-center justify-center">
        <form
          onSubmit={handleSubmit}
          className="info-section mt-20 mb-10  w-4/6 flex flex-col items-center space-y-10"
        >
          <div className="nav w-full md:w-3/4 h-16 bg-terrapurple flex items-center rounded-full justify-between px-5 ">
            <button
              type="button"
              className="login  w-1/2 h-2/3 rounded-full flex justify-center items-center"
            >
              <p className="text-terrabl">Login</p>
            </button>
            <button
              type="button"
              className="register w-1/2 h-2/3 bg-terrablue rounded-full flex justify-center items-center"
            >
              <p className="text-white">Register</p>
            </button>
          </div>

          <div className="info w-full">
            <p className="font-sans font-light">
              Enter your details and join the Terra family today
            </p>
          </div>

          <div className="details w-full">
            <p className="font-sans font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              First name
            </p>
            <input
              className={`h-10 w-full py-6 font-light rounded-full border border-terragray px-5`}
              type="text"
              required
              placeholder="Enter your User name"
            />
          </div>

          <div className="details w-full">
            <p className="font-sans font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Last name
            </p>
            <input
              className={`h-10 w-full py-6 font-light rounded-full border border-terragray px-5`}
              type="text"
              required
              placeholder="Enter your User name"
            />
          </div>

          <div className="details w-full">
            <p className="font-sans font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Email Address
            </p>
            <input
              className={`h-10 w-full py-6 font-light rounded-full border ${
                emailError ? "border-red-500" : "border-terragray"
              } px-5`}
              type="email"
              required
              placeholder="Enter your Email Address"
              value={email}
              onChange={handleEmailChange}
            />
            {emailError && <p className="text-red-500 text-sm mt-1">{emailError}</p>}
          </div>
          <div className="details w-full">
            <p className="font-sans font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Password
            </p>
            <div className="relative w-full">
              <input
                className="h-10 w-full py-6 font-light rounded-full border border-terragray px-5 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Enter your Password"
                value={password}
                onChange={handlePasswordChange}
              />
              <span
                className="absolute top-1/2 right-4 transform -translate-y-1/2 cursor-pointer text-eye text-xl text-gray-700"
                role="button"
                aria-label={passwordVisible ? "Hide password" : "Show password"}
                onClick={togglePasswordVisibility}
              >
                {passwordVisible ? <IoEyeOff /> : <IoEye />}
              </span>
            </div>
          </div>
          <div className="details w-full">
            <p className="font-sans font-light mb-2 after:content-['*'] after:ml-0.5 after:text-red-500">
              Confirm Password
            </p>
            <div className="relative w-full">
              <input
                className="h-10 w-full py-6 font-light rounded-full border border-terragray px-5 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Renter your Password"
                value={confirmPassword}
                onChange={handleConfirmPasswordChange}
              />
              <span
                className="absolute top-1/2 right-4 transform -translate-y-1/2 cursor-pointer text-eye text-xl text-gray-700"
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
            <div className="login-btn w-2/5">
              <button
                type="submit"
                className="w-full h-12 bg-terrablue rounded-full text-white text-xs"
              >
                Register
              </button>
            </div>

            <p className="font-sans font-light -my-3">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-8/12 h-12 rounded-full flex items-center justify-center border border-black"
            >
              <FcGoogle className="text-2xl mr-2" />
              <p className="font-sans font-light text-sm ">Continue with Google</p>
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default SignUpCard;
