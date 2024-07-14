"use client";

import React from "react";
import ResetInputEmail from "@/components/Authentication/ResetInputEmail";
import ResetBackground from "@/components/Authentication/ResetBackground";
import { env } from "next-runtime-env";
import axios from "axios";
import { useRouter } from "next/navigation";

const Reset: React.FC = () => {
  const router = useRouter();

  const handleSubmit = async (email: string) => {
    const baseUrl = env("NEXT_PUBLIC_BASE_URL");
    const response = await axios.post(`${baseUrl}Auth/forgot-password`, { email });
    if (response.status === 200) {
      router.push(`/otp/${email}`);
      alert("Success");
    } else {
      alert("Email not found");
    }
  };

  return (
    <div>
      <ResetBackground description="Reset password" card={ResetInputEmail} action={handleSubmit} />
    </div>
  );
};

export default Reset;
