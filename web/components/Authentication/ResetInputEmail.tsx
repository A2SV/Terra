"use client";

import React, { useState } from "react";
import Link from "next/link";

const ResetInputEmail = () => {
  const [email, setEmail] = useState("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
  };

  return (
    <div className="w-10/12 md:w-8/12 flex flex-col items-center justify-center mx-auto">
      <div className="flex justify-center items-center p-3 px-2 w-full text-md font-normal font-nunito">
        Enter your email address, you will receive a link in your email to create a new password
      </div>

      <div className="p-3 w-full">
        <form onSubmit={handleSubmit}>
          <span className="text-md font-normal font-nunito">Email Address</span>
          <div className="pt-2">
            <label>
              <input
                type="email"
                value={email}
                placeholder="Email Address"
                onChange={(e) => setEmail(e.target.value)}
                required
                className="font-nunito rounded-3xl w-full h-12 border border-terragray px-3 py-2 focus:outline-none focus:border-terrablue"
              />
            </label>
          </div>
          <div className="pt-9 text-sm font-sans">
            <Link href="/otp">
              <button
                type="submit"
                className="rounded-3xl bg-terrablue w-36 h-12 text-white hover:bg-blue-800 font-sans"
              >
                Continue
              </button>
            </Link>
          </div>
        </form>
      </div>
    </div>
  );
};

export default ResetInputEmail;
