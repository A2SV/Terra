import React from "react";
import ResetSuccess from "@/components/Authentication/ResetSuccess";
import ResetBackground from "@/components/Authentication/ResetBackground";

const Reset: React.FC = () => {
  return (
    <div>
      <ResetBackground description="Reset Success" card={ResetSuccess} action={undefined} />
    </div>
  );
};

export default Reset;
