"use client";
import ResetSuccess from "@/components/ResetSuccess";
import AuthBackground from "../components/Authentication/AuthBackground";

const Home: React.FC = () => {
  const handleSubmit = () => {};
  return (
    <div>
      <AuthBackground description="Sign In" />
      <ResetSuccess onSubmit={() => handleSubmit()} />;
    </div>
  );
};

export default Home;
