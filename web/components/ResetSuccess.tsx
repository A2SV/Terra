import React from "react";

type ResetSuccessProps = {
  onSubmit: () => void;
};

const ResetSuccess: React.FC<ResetSuccessProps> = ({ onSubmit }) => {
  return (
    <div className="flex-col w-[26rem] p-0">
      <div className="p-3 pl-2 pr-2 w-full text-sm font-sans">
        <p>
          Note:<br></br> Your password has been reset! successfully
        </p>
      </div>

      <div className="pt-5 text-sm font-sans">
        <button
          type="submit"
          onClick={onSubmit}
          className="rounded-3xl bg-terrablue w-36 h-12 text-white hover:bg-blue-800 font-sans"
        >
          Back to login
        </button>
      </div>
    </div>
  );
};

export default ResetSuccess;
