"use client";

import React from "react";
import ResetNew from "@/components/Authentication/ResetNew";
import ResetBackground from "@/components/Authentication/ResetBackground";
import { useRouter } from "next/router";

const Reset: React.FC = () => {
  const { query } = useRouter();
  const token = query.token || "";
  const email = query.email || "";

  if (!token || !email) {
    return (
      <div className="items-center justify-center">
        <h1 className="text-lg font-bold">The page you are looking for is not available.</h1>
      </div>
    );
  }

  const CardWithProps = () => <ResetNew email={email.toString()} token={token.toString()} />;

  return (
    <div>
      <ResetBackground description="Reset password" Card={CardWithProps} />
    </div>
  );
};

export default Reset;
