import React from "react";
import Link from "next/link";

const ResetSuccess: React.FC = () => {
  return (
    <div className="flex-col w-[26rem] p-0">
      <div className="p-3 pl-2 pr-2 w-full text-sm font-sans">
        <p>
          Note:<br></br> Your password has been reset! successfully
        </p>
      </div>

      <div className="pt-5 text-sm font-sans">
        <Link href="/auth">
          <button
            type="submit"
            className="rounded-3xl bg-terrablue w-36 h-12 text-white hover:bg-blue-800 font-sans"
          >
            Back to login
          </button>
        </Link>
      </div>
    </div>
  );
};

export default ResetSuccess;
