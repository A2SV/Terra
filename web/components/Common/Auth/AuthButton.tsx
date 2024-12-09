import React from "react";
import SpinnerComponent from "@/components/Common/Reusable/Spinner";

interface Props {
  loading: boolean;
  isButtonDisabled: boolean;
  action: any;
  text: string;
}

const AuthButton: React.FC<Props> = ({ loading, action, text, isButtonDisabled }) => {
  return (
    <div className=" w-3/4 md:w-6/12 h-10 mt-4">
      <button
        type="submit"
        className="w-full h-10 font-nunito font-normal bg-terrablue rounded-full flex items-center justify-center  text-white text-sm"
        disabled={isButtonDisabled}
        onClick={action}
      >
        {loading ? <SpinnerComponent /> : `${text}`}
      </button>
    </div>
  );
};

export default AuthButton;
