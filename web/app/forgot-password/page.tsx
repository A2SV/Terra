"use client";

import ResetInputEmail from "@/components/ResetInputEmail";
import React from "react";
import { env } from "next-runtime-env";
import axios from "axios";
import { useRouter } from "next/navigation";

const ForgotPage: React.FC = () => {
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
      <ResetInputEmail onSubmit={handleSubmit} />
    </div>
  );
};

export default ForgotPage;
