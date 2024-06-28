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
      },
      fontFamily: {
        montserrat: ["Montserrat", "sans-serif"],
        pops: ["Poppins", "sans-serif", "Arial"],
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
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config;

export default config;
