import React from "react";
import AuthBackground from "@/components/Authentication/AuthBackground";
import SignupCard from "@/components/SignupCard";

const SignUp = () => {
  return (
    <div>
      <AuthBackground description="Sign up" Card={SignupCard} />
    </div>
  );
};

export default SignUp;
