"use client";

import React, { useState, ChangeEvent, FormEvent } from "react";
import { IoEye, IoEyeOff } from "react-icons/io5";
import { FcGoogle } from "react-icons/fc";
import Link from "next/link";
import { signIn } from "next-auth/react";
import { useRouter } from "next/navigation";
import ErrorMessage from "@/components/Common/Reusable/ErrorMessage";
import SuccessMessage from "@/components/Common/Reusable/SuccessMessage";
import AuthButton from "@/components/Common/Auth/AuthButtons";

const LoginCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [userName, setUserName] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  const [successMessage, setSuccessMessage] = useState<string>("");
  const router = useRouter();

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      const response = await signIn("credentials", {
        redirect: false,
        userName,
        password,
      });

      if (response?.error) {
        setError("Incorrect email or Password");
        setTimeout(() => {
          setError("");
        }, 5000);
      } else {
        setSuccessMessage("Login successful");
        setTimeout(() => {
          setSuccessMessage("");
          router.push("/");
        }, 700);
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
        <label className="font-nunito font-normal text-sm" htmlFor="rememberMe">
          Remember me
        </label>
      </div>
    );
  };

  const handleEmailChange = (event: ChangeEvent<HTMLInputElement>): void => {
    const { value } = event.target;
    setUserName(value);

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
      {error && !emailError && <ErrorMessage message={error}></ErrorMessage>}
      {!error && !emailError && successMessage && (
        <SuccessMessage message={successMessage}></SuccessMessage>
      )}

      <div className="bg-white flex flex-col items-center justify-center">
        <form
          onSubmit={handleSubmit}
          className="info-section w-5/6 md:w-4/6 flex flex-col items-center space-y-5"
        >
          <div className="info w-full mt-7">
            <p className="font-nunito font-normal text-sm">
              Log In and Continue Your Terra Journey
            </p>
          </div>

          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2">Email Address</p>
            <input
              className={`h-5 w-full py-5 text-sm font-nunito font-light rounded-full border focus:outline-none focus:border-terrablue ${emailError ? "border-red-500" : "border-terragray"} px-3`}
              type="email"
              required
              placeholder="Enter your Email Address"
              value={userName}
              onChange={handleEmailChange}
            />
            {emailError && <p className="text-red-500 font-nunito text-sm mt-1">{emailError}</p>}
          </div>
          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2">Password</p>
            <div className="relative w-full">
              <input
                className="h-5 w-full py-5 text-sm font-nunito font-light rounded-full border border-terragray focus:outline-none focus:border-terrablue px-3 pr-12"
                type={passwordVisible ? "text" : "password"}
                required
                placeholder="Enter your Password"
                value={password}
                onChange={handlePasswordChange}
              />
              <span
                className="absolute font-nunito top-1/2 right-4 transform -translate-y-1/2 cursor-pointer text-eye text-xl"
                role="button"
                aria-label={passwordVisible ? "Hide password" : "Show password"}
                onClick={togglePasswordVisibility}
              >
                {passwordVisible ? <IoEyeOff /> : <IoEye />}
              </span>
            </div>
          </div>

          <div className="pass-info w-full flex justify-between md:px-3">
            <RememberMeCheckbox />
            <div className="forgot">
              <Link href={"/otp"}>
                <p className="font-nunito font-normal text-sm hover:underline hover:text-terrablue">
                  Forgot Password ?
                </p>
              </Link>
            </div>
          </div>
          <div className="lower-section w-full flex flex-col items-center space-y-3">
            <AuthButton loading={loading} text="Sign Up" action={handleSubmit} />

            <p className="font-nunito font-normal text-sm">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-5/12 h-10 p-2 rounded-full flex items-center justify-center border border-terragray"
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

export default LoginCard;
