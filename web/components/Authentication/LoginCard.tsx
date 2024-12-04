"use client";

import React, { useState, useEffect, ChangeEvent, FormEvent } from "react";
import { FcGoogle } from "react-icons/fc";
import Link from "next/link";
import { signIn } from "next-auth/react";
import { useRouter } from "next/navigation";
import ErrorMessage from "@/components/Common/Reusable/ErrorMessage";
import SuccessMessage from "@/components/Common/Reusable/SuccessMessage";
import AuthButton from "@/components/Common/Auth/AuthButton";
import RememberMeCheckbox from "@/components/Common/Auth/Checkbox";

const LoginCard: React.FC = () => {
  const [passwordVisible, setPasswordVisible] = useState<boolean>(false);
  const [email, setEmail] = useState<string>("");
  const [emailError, setEmailError] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  const [successMessage, setSuccessMessage] = useState<string>("");
  const [isButtonDisabled, setIsButtonDisabled] = useState<boolean>(true);
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
        setError("Incorrect Email or Password");
        setTimeout(() => {
          setError("");
        }, 10000);
      } else {
        setSuccessMessage("Login successful");
        setTimeout(() => {
          setSuccessMessage("");
          router.push("/");
        }, 700);
      }
    } catch (error) {
      setError("An error occurred. Please try again.");
      setTimeout(() => {
        setError("");
      }, 10000);
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

  useEffect(() => {
    const isPasswordValid = password.length >= 10;
    let isValidEmail = true;

    if (emailError) {
      isValidEmail = false;
    }

    setIsButtonDisabled(!(isValidEmail && isPasswordValid));
  }, [emailError, email, password]);

  const handlePasswordChange = (event: ChangeEvent<HTMLInputElement>): void => {
    setPassword(event.target.value);
  };

  return (
    <div className="">
      {error && !emailError && (
        <ErrorMessage message={error} onClose={() => setError("")}></ErrorMessage>
      )}
      {!error && !emailError && successMessage && (
        <SuccessMessage message={successMessage}></SuccessMessage>
      )}

      <div className="bg-white flex flex-col items-center justify-center ">
        <form
          onSubmit={handleSubmit}
          className="info-section w-5/6 md:w-4/6 lg:w-3/6  flex flex-col items-center justify-center space-y-5"
        >
          <div className="info w-full mt-7">
            <p className="font-nunito font-normal text-sm">
              Log In and Continue Your Terra Journey
            </p>
          </div>

          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2">Email Address</p>
            <input
              className={`h-5 w-full md:w-12/12 py-4 text-sm font-nunito font-light rounded-full border focus:outline-none focus:border-terrablue focus:bg-white ${emailError ? "border-red-500" : "border-terragray"} px-3`}
              type="email"
              required
              placeholder="john@gmail.com"
              value={email}
              onChange={handleEmailChange}
            />
            {emailError && <p className="text-red-500 font-nunito text-sm mt-1">{emailError}</p>}
          </div>
          <div className="details w-full">
            <p className="font-nunito text-sm font-normal mb-2">Password</p>
            <div className="relative w-full">
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
                onClick={togglePasswordVisibility}
              />
            </div>
          </div>

          <div className="pass-info w-full flex justify-between md:px-3">
            <RememberMeCheckbox
              email={email}
              password={password}
              setEmail={setEmail}
              setPassword={setPassword}
            />
            <div className="forgot">
              <Link href={"/reset"}>
                <p className="font-sans font-light text-sm hover:underline hover:text-terrablue">
                  Forgot Password ?
                </p>
              </Link>
            </div>
          </div>
          <div className="lower-section w-full flex flex-col items-center space-y-2">
            <AuthButton
              loading={loading}
              isButtonDisabled={isButtonDisabled}
              text="Login"
              action={handleSubmit}
            />

            <p className="font-nunito font-normal text-sm">or</p>

            <button
              type="button"
              className="google w-3/4 md:w-6/12 h-10 p-2 rounded-full flex items-center justify-center border border-terragray"
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

export default LoginCard;
