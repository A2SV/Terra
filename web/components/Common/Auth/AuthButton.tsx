import React from "react";
import Spinner from "@/components/Common/Reusable/Spinner";

interface Props {
  loading: boolean;
  isButtonDisabled: boolean;
  action: any;
  text: string;
}

const AuthButton: React.FC<Props> = ({ loading, action, text, isButtonDisabled }) => {
  return (
    <div className="w-4/12 md:w-3/12 mt-4">
      <button
        type="submit"
        className="w-full h-10 font-nunito font-normal bg-terrablue rounded-full text-white text-sm"
        disabled={isButtonDisabled}
        onClick={action}
      >
        {loading ? <Spinner /> : `${text}`}
      </button>
    </div>
  );
};

export default AuthButton;
