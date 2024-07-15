import React from "react";
import SpinnerComponent from "../Reusable/SpinnerComponent";

interface Props {
  loading: boolean;
  action: any;
  text: string;
}

const AuthButton: React.FC<Props> = ({ loading, action, text }) => {
  return (
    <div className="w-4/12 md:w-3/12 mt-4">
      <button
        type="submit"
        className="w-full h-8 font-nunito font-normal bg-terrablue rounded-full text-white text-xs"
        onClick={action}
      >
        {loading ? <SpinnerComponent /> : `${text}`}
      </button>
    </div>
  );
};

export default AuthButton;
