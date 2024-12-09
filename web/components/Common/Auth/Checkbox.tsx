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
    const savedEmail = localStorage.getItem("rememberedEmail");
    const savedPassword = localStorage.getItem("rememberedPassword");

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
      localStorage.setItem("rememberedEmail", email);
      localStorage.setItem("rememberedPassword", password);
    } else {
      localStorage.removeItem("rememberedEmail");
      localStorage.removeItem("rememberedPassword");
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
