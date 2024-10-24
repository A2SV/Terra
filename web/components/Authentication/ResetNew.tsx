import React, { useState, useEffect } from "react";
import { IoMdEye, IoMdEyeOff } from "react-icons/io";
import SuccessMessage from "../Common/Reusable/SuccessMessage";
import { useRouter } from "next/navigation";
import axios from "axios";
import AuthButton from "../Common/Auth/AuthButton";

interface ResetNewProps {
  email: string;
  token: string;
}

const ResetNew: React.FC<ResetNewProps> = ({ email, token }) => {
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
    setShowPassword1(true);
  };

  const togglePasswordVisibility2 = () => {
    setShowPassword2(true);
  };

  useEffect(() => {
    const isPasswordValid =
      password1.length >= 10 && password1 === password2 && password1.length > 0;

    setIsButtonDisabled(!isPasswordValid);
  }, [password1, password2]);

  const handlePasswordReset = () => {
    setLoading(true);
    setError("");
    setSuccessMessage("");

    setTimeout(async () => {
      if (password1.length === 0 || password2.length === 0) {
        setError("Passwords cannot be empty.");
        setLoading(false);
      } else if (password1 === password2 && password1.length > 0) {
        setSuccessMessage("Password successfully reset.");
        setLoading(false);

        setTimeout(() => {
          setSuccessMessage("");
          router.push("/auth");
        }, 1000);
      } else {
        try {
          await resetPasswordApi();
          setSuccessMessage("Password successfully reset.");
          setLoading(false);

          setTimeout(() => {
            setSuccessMessage("");
            router.push("/auth");
          }, 1000);
        } catch (error: any) {
          setError(error.message);
          setLoading(false);
        }
      }
    }, 1000);
  };
  const baseUrl = process.env.NEXT_PUBLIC_API_URL;
  const resetPasswordApi = async () => {
    try {
      await axios({
        method: "POST",
        url: `${baseUrl}/auth/reset-password`,
        data: {
          email,
          token,
          newPassword: password1,
          confirmPassword: password2,
        },
        headers: {
          "Content-Type": "application/json",
        },
      });

      setTimeout(() => {
        setSuccessMessage("");
        router.push("/auth");
      }, 1000);
    } catch (error: any) {
      setError(error.response.data.message || "Failed to reset password");
      setLoading(false);
    }
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
          <div>
            <p className="mb-2 text-sm">Password</p>

            <div className="relative mb-8 text-sm">
              <input
                className={`border ${error ? "border-red-500" : "border-terragray"} focus:outline-none focus:border-terrablue  rounded-full py-3 px-6 w-full`}
                type={showPassword1 ? "text" : "password"}
                placeholder="Enter your password"
                value={password1}
                onChange={(e) => setPassword1(e.target.value)}
              />
              {error ? <p className="text-red-500 text-sm mt-1">{error}</p> : <p></p>}
              <button className="absolute top-[25%] right-[5%]" onClick={togglePasswordVisibility1}>
                {showPassword1 ? (
                  <IoMdEyeOff className="size-5 text-terragray" />
                ) : (
                  <IoMdEye className="size-5 text-terragray" />
                )}
              </button>
            </div>
          </div>

          <div>
            <p className="mb-2 text-sm">Confirm password</p>

            <div className="relative text-sm">
              <input
                className={`border ${error ? "border-red-500" : "border-terragray"} focus:outline-none focus:border-terrablue rounded-full py-3 px-6 w-full`}
                type={showPassword2 ? "text" : "password"}
                placeholder="Re-enter your password"
                value={password2}
                onChange={(e) => setPassword2(e.target.value)}
              />
              {error ? <p className="text-red-500 text-sm mt-1">{error}</p> : <p></p>}
              <button className="absolute top-[25%] right-[5%]" onClick={togglePasswordVisibility2}>
                {showPassword2 ? (
                  <IoMdEyeOff className="size-5 text-terragray" />
                ) : (
                  <IoMdEye className="size-5 text-terragray" />
                )}
              </button>
            </div>
          </div>

          <div>
            <AuthButton
              loading={loading}
              isButtonDisabled={isButtonDisabled}
              text="Set new password"
              action={handlePasswordReset}
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default ResetNew;
