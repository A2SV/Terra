import React from "react";

interface Props {
  loading: boolean;
  action: any;
  text: string;
}

const AuthButton: React.FC<Props> = ({ action }) => {
  return (
    <div className="w-2/5 ">
      <button
        type="submit"
        className="w-full h-12 bg-terrablue rounded-full text-white text-xs"
        onClick={action}
      ></button>
    </div>
  );
};

export default AuthButton;
