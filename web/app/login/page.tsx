import React from "react";
import LoginCard from "@/components/LoginCard";
import AuthBackground from "@/components/Authentication/AuthBackground";

const Login = () => {
  return (
    <div>
      <AuthBackground description="Sign In" Card={LoginCard} />
    </div>
  );
};

export default Login;
