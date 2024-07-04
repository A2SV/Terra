"use client";

import React, { useState, ChangeEvent, FormEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { FcGoogle } from "react-icons/fc";
import Link from "next/link";
import { signIn } from "next-auth/react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import ErrorIcon from "@/public/ErrorIcon.svg";
import AuthButton from "@/components/Common/Auth/AuthButton";

const LoginCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [email, setEmail] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  const router = useRouter();

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      const response = await signIn("credentials", {
        redirect: false,
        email,
        password,
      });

      if (response?.error) {
        setError(response.error);
      } else {
        router.push("/");
      }
    } catch (error) {
      setError("An error occurred. Please try again.");
    }

    setLoading(false);
  };

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

  return (
    <div className="">
      <div className="bg-white flex flex-col items-center justify-center">
        <form
          onSubmit={handleSubmit}
          className="info-section w-[60%] flex flex-col items-center space-y-10"
        >
          <div className="info w-full">
            <p className="font-sans font-light">
              Enter your details and join the Terra family today
            </p>
          </div>

          {error && (
            <div
              className="flex items-center bg-red-100 border text-sm text-text font-pops font-medium px-4 py-3 rounded relative"
              role="alert"
            >
              <Image className="mr-4" src={ErrorIcon} alt="single blog" />
              <span className="block sm:inline">{error}</span>
            </div>
          )}

          <div className="details w-full">
            <p className="font-sans font-light mb-2">Email Address</p>
            <input
              className={`h-10 w-full   py-6 font-light rounded-full border ${
                emailError ? "border-red-500" : "border-terraGray"
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
            <p className="font-sans font-light mb-2">Password</p>
            <div className="relative w-full">
              <input
                className="h-10 w-full py-6 font-light rounded-full border border-terraGray px-5"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Enter your Password"
                value={password}
                onChange={handlePasswordChange}
              />
              <span
                className="absolute top-1/2 right-4 transform -translate-y-1/2 cursor-pointer text-eye text-xl"
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
            <AuthButton loading={loading} text="Sign Up" action={handleSubmit} />

            <p className="font-sans font-light -my-3">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-8/12 h-12 rounded-full flex items-center justify-center border border-terragray"
              onClick={() => {
                signIn("google");
              }}
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
