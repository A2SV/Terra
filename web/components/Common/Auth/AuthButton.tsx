import React from "react";
import SpinnerComponent from "../Reusable/SpinnerComponent";

interface Props {
  loading: boolean;
  action: any;
  text: string;
}

const AuthButton: React.FC<Props> = ({ loading, action, text }) => {
  return (
    <div className="w-2/5 ">
      <button
        type="submit"
        className="w-full h-12 bg-terrablue rounded-full text-white text-xs"
        onClick={action}
      >
        {loading ? <SpinnerComponent /> : `${text}`}
      </button>
    </div>
  );
};

export default AuthButton;
