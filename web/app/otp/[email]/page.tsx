import React from "react";
import OtpVerification from "@/components/Authentication/OtpVerification";

const Otp: any = ({
  params,
}: {
  params: {
    email: string;
  };
}) => {
  // Decode the email parameter
  const decodedEmail = decodeURIComponent(params.email);

  return (
    <div>
      <OtpVerification email={decodedEmail} />
    </div>
  );
};

export default Otp;
