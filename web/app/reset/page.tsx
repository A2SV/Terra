import React from "react";
import ResetInputEmail from "@/components/Authentication/ResetInputEmail";
import ResetBackground from "@/components/Authentication/ResetBackground";

const Reset: React.FC = () => {
  return (
    <div>
      <ResetBackground description="Reset password" Card={ResetInputEmail} />
    </div>
  );
};

export default Reset;
