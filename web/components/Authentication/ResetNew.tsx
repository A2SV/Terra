import React, { useState, useEffect } from "react";
import { IoMdEye, IoMdEyeOff } from "react-icons/io";
import SuccessMessage from "../Common/Reusable/SuccessMessage";
import { useRouter } from "next/navigation";
import axios from "axios";
import AuthButton from "../Common/Auth/AuthButton";

interface ResetNewProps {
  token: string;
}

const ResetNew: React.FC<ResetNewProps> = ({ token }) => {
  const [password1, setPassword1] = useState("");
  const [password2, setPassword2] = useState("");
  const [showPassword1, setShowPassword1] = useState(false);
  const [showPassword2, setShowPassword2] = useState(false);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>("");
  const [successMessage, setSuccessMessage] = useState<string>("");
  const [isButtonDisabled, setIsButtonDisabled] = useState<boolean>(true);
  const router = useRouter();

  const togglePasswordVisibility1 = () => {
    setShowPassword1(!showPassword1);
  };

  const togglePasswordVisibility2 = () => {
    setShowPassword2(!showPassword2);
  };

  useEffect(() => {
    const isPasswordValid = password1.length >= 10 && password1 === password2;
    setIsButtonDisabled(!isPasswordValid);
  }, [password1, password2]);

  const handlePasswordReset = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    setSuccessMessage("");

    try {
      if (password1.length === 0 || password2.length === 0) {
        setError("Passwords cannot be empty.");
        setLoading(false);
      } else if (password1 === password2 && password1.length > 0) {
        await resetPasswordApi();
      }
    } catch (error: any) {
      setError(error.response?.data?.message || "Failed to reset password");
      setLoading(false);
    }
  };

  const resetPasswordApi = async () => {
    const baseUrl = process.env.NEXT_PUBLIC_BASE_URL;
    await axios({
      method: "POST",
      url: `${baseUrl}Auth/reset-password?token=${token}`,
      data: {
        newPassword: password1,
        confirmPassword: password2,
      },
      headers: {
        "Content-Type": "application/json",
      },
    });

    setSuccessMessage("Password successfully reset.");
    setLoading(false);

    setTimeout(() => {
      setSuccessMessage("");
      router.push("/auth");
    }, 1000);
  };

  return (
    <div>
      <div className="w-10/12 md:w-8/12 flex items-center justify-center mx-auto">
        {!error && successMessage && <SuccessMessage message={successMessage}></SuccessMessage>}
        <div>
          <h1 className="my-1 font-medium"> Hint: </h1>
          <p className="font-normal text-sm mb-7">
            Use a memorable detail, like a favorite book, pet&apos;s name, or special date. Include
            symbols and capital letters for security.
          </p>
          <form onSubmit={handlePasswordReset}>
            <div>
              <p className="mb-2 text-sm">Password</p>
              <div className="relative mb-8 text-sm">
                <input
                  className={`border ${error ? "border-red-500" : "border-terragray"} focus:outline-none focus:border-terrablue rounded-full py-3 px-6 w-full`}
                  type={showPassword1 ? "text" : "password"}
                  placeholder="Enter your password"
                  value={password1}
                  onChange={(e) => setPassword1(e.target.value)}
                />
                <button
                  type="button"
                  className="absolute top-1/2 right-3 transform -translate-y-1/2 cursor-pointer"
                  onClick={togglePasswordVisibility1}
                >
                  {showPassword1 ? <IoMdEyeOff /> : <IoMdEye />}
                </button>
              </div>
              <p className="mb-2 text-sm">Confirm Password</p>
              <div className="relative mb-8 text-sm">
                <input
                  className={`border ${error ? "border-red-500" : "border-terragray"} focus:outline-none focus:border-terrablue rounded-full py-3 px-6 w-full`}
                  type={showPassword2 ? "text" : "password"}
                  placeholder="Confirm your password"
                  value={password2}
                  onChange={(e) => setPassword2(e.target.value)}
                />
                <button
                  type="button"
                  className="absolute top-1/2 right-3 transform -translate-y-1/2 cursor-pointer"
                  onClick={togglePasswordVisibility2}
                >
                  {showPassword2 ? <IoMdEyeOff /> : <IoMdEye />}
                </button>
              </div>
            </div>
            {error && <p className="text-red-500 text-sm mt-1">{error}</p>}
            <AuthButton
              loading={loading}
              isButtonDisabled={isButtonDisabled}
              text="Reset Password"
              action={handlePasswordReset}
            />
          </form>
        </div>
      </div>
    </div>
  );
};

export default ResetNew;
