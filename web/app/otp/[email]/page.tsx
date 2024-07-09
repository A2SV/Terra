import React from "react";
import OtpVerification from "@/components/Authentication/OtpVerification";

const Otp: any = ({
  params,
}: {
  params: {
    email: string;
  };
}) => {
  return (
    <div>
      <OtpVerification email={params.email} />
    </div>
  );
};

export default Otp;
