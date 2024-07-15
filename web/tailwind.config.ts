import type { Config } from "tailwindcss";

const config = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
    "node_modules/flowbite-react/lib/esm/**/*.js",
  ],
  prefix: "",
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        card: "230px",
        sm: "640px",
        md: "768px",
        lg: "1024px",
        xl: "1280px",
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        terrablue: "#1779F3",
        terrapurple: "#605DEC14",
        terragray: "#3A3A3A99",
        btnColor: "#007DFC",
        btnTextColor: "#FFFFFF",
        normalTextColor: "#3A3A3A",
        inputColor: "#605DEC14",
        pageColor: "#FFFFFF",
        blue: "#264fad",
        primary: "#264FAD",
        btn: "#264FAD",
        input: "#EFF3F9",
        text: "#434343",
        eye: "#B7B7B7",
        fileUpload: "#F2F3F4",
        blog: "#746F6F",
        tag: "#F5F5F5",
        varietyBlue: "rgb(59 130 246)",
        listingBlue: "#0066CC",
        "hover-blue": "#1e3f8d",
        backgroundColor: "#F5F5F5E8",
        bulletColor: "#05E200",
      },

      fontFamily: {
        montserrat: ["Montserrat", "sans-serif"],
        pops: ["Poppins", "sans-serif", "Arial"],
        nunito: ["Nunito Sans", "sans-serif"],
        imCanon: ['"IM Fell French Canon"', "serif"],
      },
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic": "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
      fontWeight: {
        extraThin: "300",
      },

      fontSize: {
        line: "2px",
        tiny: "0.625rem", // 10px
        huge: "3rem", // 48px
        giant: "5rem", // 80px
        sans: ["Nunito Sans", "sans-serif"],
      },

      keyframes: {
        "slide-in": {
          "0%": { transform: "translateX(100%)", opacity: "0" },
          "100%": { transform: "translateX(0)", opacity: "1" },
        },
      },
      animation: {
        "slide-in": "slide-in 0.5s forwards",
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config;

export default config;
