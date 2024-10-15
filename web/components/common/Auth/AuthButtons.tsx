import React from "react";
<<<<<<< HEAD
import SpinnerComponent from "@/components/Common/Reusable/Spinner";
=======
import Spinner from "@/components/Common/Reusable/Spinner";
>>>>>>> 89720f9 (Ggpp 198 design home page (#132))

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
<<<<<<< HEAD
        {loading ? <SpinnerComponent /> : `${text}`}
=======
        {loading ? <Spinner /> : `${text}`}
>>>>>>> 89720f9 (Ggpp 198 design home page (#132))
      </button>
    </div>
  );
};

export default AuthButton;
