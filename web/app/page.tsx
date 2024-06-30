"use client";
import AuthBackground from "../components/Authentication/AuthBackground";
import ResetInputEmail from "@/components/ResetInputEmail";

const Home: React.FC = () => {
  const handleSubmit = (email: string) => {};

  return (
    <div>
      <AuthBackground description="Sign In" />
      <ResetInputEmail onSubmit={handleSubmit} />;
    </div>
  );
};

export default Home;
