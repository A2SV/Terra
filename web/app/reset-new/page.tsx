import React from "react";
import ResetNew from "@/components/ResetNew";
import ResetBackground from "@/components/Authentication/ResetBackground";

const Reset: React.FC = () => {
  return (
    <div>
      <ResetBackground description="Reset password" Card={ResetNew} />
    </div>
  );
};

export default Reset;
