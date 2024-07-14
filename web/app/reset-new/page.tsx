import React from "react";
import ResetNew from "@/components/Authentication/ResetNew";
import ResetBackground from "@/components/Authentication/ResetBackground";

const Reset: React.FC = () => {
  const handleAction = () => {};

  return (
    <div>
      <ResetBackground description="Reset password" card={ResetNew} action={handleAction} />
    </div>
  );
};

export default Reset;
