"use client";

import React, { useState, ChangeEvent, FormEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { FcGoogle } from "react-icons/fc";
import Link from "next/link";

const LoginCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [email, setEmail] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");

  const togglePasswordVisibility = (): void => {
    setPasswordVisible(!passwordVisible);
    if (!passwordVisible) {
      setTimeout(() => {
        setPasswordVisible(false);
      }, 700);
    }
  };

  const RememberMeCheckbox: React.FC = () => {
    const [isChecked, setIsChecked] = useState<boolean>(false);

    const handleCheckboxChange = (event: ChangeEvent<HTMLInputElement>): void => {
      setIsChecked(event.target.checked);
    };

    return (
      <div className="remember flex">
        <input
          type="checkbox"
          name="rememberMe"
          id="rememberMe"
          checked={isChecked}
          onChange={handleCheckboxChange}
          className="mr-2"
        />
        <label className="font-sans font-light text-sm" htmlFor="rememberMe">
          Remember me
        </label>
      </div>
    );
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

  const handleSubmit = (event: FormEvent<HTMLFormElement>): void => {
    event.preventDefault();
  };

  return (
    <div className="body lg:h-screen bg-gray-400 lg:flex">
      <div className="body-left bg-zinc-800 lg:w-1/2"></div>
      <div className="body-right bg-white w-screen lg:w-1/2 flex flex-col items-center justify-center">
        <form
          onSubmit={handleSubmit}
          className="info-section w-4/6 flex flex-col items-center space-y-10"
        >
          <div className="nav w-full md:w-3/4 h-16 bg-[#605DEC14] flex items-center rounded-full justify-between px-5 ">
            <button
              type="button"
              className="login bg-terrablue w-1/2 h-2/3 rounded-full flex justify-center items-center"
            >
              <p className="text-white">Login</p>
            </button>
            <button
              type="button"
              className="register w-1/2 h-2/3 rounded-full flex justify-center items-center"
            >
              <p className="text-terrablue">Register</p>
            </button>
          </div>

          <div className="info w-full">
            <p className="font-sans font-light">
              Enter your details and join the Terra family today
            </p>
          </div>
          <div className="details w-full">
            <p className="font-sans font-light mb-2">Email Address</p>
            <input
              className={`h-10 w-full py-6 font-light rounded-full border ${emailError ? "border-red-500" : "border-[#3A3A3A99]"} px-5`}
              type="email"
              required
              placeholder="Enter your Email Address"
              value={email}
              onChange={handleEmailChange}
            />
            {emailError && <p className="text-red-500 text-sm mt-1">{emailError}</p>}
          </div>
          <div className="details w-full">
            <p className="font-sans font-light mb-2">Password</p>
            <div className="relative w-full">
              <input
                className="h-10 w-full py-6 font-light rounded-full border border-[#3A3A3A99] px-5 pr-12"
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

          <div className="pass-info w-full flex justify-between">
            <RememberMeCheckbox />
            <div className="forgot">
              <Link href={``}>
                <p className="font-sans font-light text-sm hover:underline hover:text-terrablue">
                  Forgot Password ?
                </p>
              </Link>
            </div>
          </div>
          <div className="lower-section w-full flex flex-col items-center space-y-3">
            <div className="login-btn w-2/5">
              <button
                type="submit"
                className="w-full h-12 bg-terrablue rounded-full text-white text-xs"
              >
                Login
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

export default LoginCard;