import React, { useState, useEffect, ChangeEvent } from "react";

interface RememberMeCheckboxProps {
  email: string;
  password: string;
  setEmail: (email: string) => void;
  setPassword: (password: string) => void;
}

const RememberMeCheckbox: React.FC<RememberMeCheckboxProps> = ({
  email,
  password,
  setEmail,
  setPassword,
}) => {
  const [isChecked, setIsChecked] = useState<boolean>(false);

  useEffect(() => {
    const getCookie = (name: string): string | null => {
      const value = `; ${document.cookie}`;
      const parts = value.split(`; ${name}=`);
      if (parts.length === 2) {
        return parts.pop()?.split(";").shift() || null;
      }
      return null;
    };

    const savedEmail = getCookie("rememberedEmail");
    const savedPassword = getCookie("rememberedPassword");

    if (savedEmail && savedPassword) {
      setEmail(savedEmail);
      setPassword(savedPassword);
      setIsChecked(true);
    }
  }, [setEmail, setPassword]);

  const handleCheckboxChange = (event: ChangeEvent<HTMLInputElement>): void => {
    const checked = event.target.checked;
    setIsChecked(checked);

    if (checked) {
      document.cookie = `rememberedEmail=${email}; path=/; max-age=31536000;`; // 1 year
      document.cookie = `rememberedPassword=${password}; path=/; max-age=31536000;`;
    } else {
      document.cookie = `rememberedEmail=; path=/; max-age=0;`;
      document.cookie = `rememberedPassword=; path=/; max-age=0;`;
    }
  };

  return (
    <div className="remember flex">
      <input
        type="checkbox"
        name="rememberMe"
        id="rememberMe"
        checked={isChecked}
        onChange={handleCheckboxChange}
        className="mr-2"
      />
      <label className="font-nunito font-normal text-sm" htmlFor="rememberMe">
        Remember me
      </label>
    </div>
  );
};

export default RememberMeCheckbox;
