"use client";
import React, { useState } from "react";
import { Button, Modal } from "react-bootstrap";
import styled from "styled-components";
import { IoMdEye, IoMdEyeOff } from "react-icons/io";

const ResetNew = () => {
  const [password1, setPassword1] = useState("");
  const [password2, setPassword2] = useState("");
  const [showPassword1, setShowPassword1] = useState(false);
  const [showPassword2, setShowPassword2] = useState(false);
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [showErrorModal, setShowErrorModal] = useState(false);

  const togglePasswordVisibility1 = () => {
    setShowPassword1((prevState) => !prevState);
  };

  const togglePasswordVisibility2 = () => {
    setShowPassword2((prevState) => !prevState);
  };

  const StyledModal = styled(Modal)`
    .modal-dialog {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: calc(100% - 1rem);
    }

    .modal-content {
      background-color: white;
      border-radius: 0.5rem;
    }
  `;

  const handlePasswordReset = () => {
    if (password1 === password2) {
      setShowSuccessModal(true);
    } else {
      setShowErrorModal(true);
    }
  };
  const handleCloseSuccessModal = () => {
    setShowSuccessModal(false);
  };

  const handleCloseErrorModal = () => {
    setShowErrorModal(false);
  };

  return (
    <div>
      <div className="flex h-screen items-center">
        <div className="w-1/2">
          <h1>Picture</h1>
        </div>

        <div>
          <h1 className="text-red-500 pt-3 opacity-90">
            {" "}
            <strong>Hint: </strong>
          </h1>
          <p className="opacity-90">
            Use a memorable detail, like a favorite book, pet&apos;s name, or <br />
            special date. Include symbols and capital letters for security.
          </p>
          <br /> <br />
          <div>
            <p className="opacity-90">Password</p>
            <br />
            <div className="relative">
              <input
                className="border-2 border-[#3A3A3A] opacity-60 rounded-full py-3 px-6 w-full"
                type={showPassword1 ? "text" : "password"}
                placeholder="Enter your password"
                value={password1}
                onChange={(e) => setPassword1(e.target.value)}
              />
              <button className="absolute top-[25%] right-[5%]" onClick={togglePasswordVisibility1}>
                {showPassword1 ? <IoMdEyeOff className="size-7" /> : <IoMdEye className="size-7" />}
              </button>
            </div>
          </div>
          <br /> <br />
          <div>
            <p className="opacity-90">Confirm password</p>
            <br />
            <div className="relative">
              <input
                className="border-2 border-[#3A3A3A] opacity-60 rounded-full py-3 px-6 w-full"
                type={showPassword2 ? "text" : "password"}
                placeholder="Re-enter your password"
                value={password2}
                onChange={(e) => setPassword2(e.target.value)}
              />
              <button className="absolute top-[25%] right-[5%]" onClick={togglePasswordVisibility2}>
                {showPassword2 ? <IoMdEyeOff className="size-7" /> : <IoMdEye className="size-7" />}
              </button>
            </div>
          </div>
          <br /> <br /> <br />
          <button
            className="bg-[#177af3] rounded-full py-3 px-6 text-white"
            type="submit"
            onClick={handlePasswordReset}
          >
            Set new password
          </button>
        </div>
      </div>

      {/* Success Modal */}
      <StyledModal centered show={showSuccessModal} onHide={handleCloseSuccessModal}>
        <Modal.Header closeButton>
          <Modal.Title>Success!</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <p>Your password has been successfully reset.</p>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="primary" onClick={handleCloseSuccessModal}>
            Close
          </Button>
        </Modal.Footer>
      </StyledModal>

      {/* Error Modal */}
      <StyledModal centered show={showErrorModal} onHide={handleCloseErrorModal}>
        <Modal.Header closeButton>
          <Modal.Title>Error</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <p>Passwords do not match. Please try again.</p>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="primary" onClick={handleCloseErrorModal}>
            Close
          </Button>
        </Modal.Footer>
      </StyledModal>
    </div>
  );
};

export default ResetNew;
