import type { Config } from "tailwindcss";

const config = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
    "node_modules/flowbite-react/lib/esm/**/*.js",
    "./node_modules/flowbite-react/**/*.js",
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
        breadCrumb: "#6C757D",
        listBlue: "#409FFF",
        terraGreen: "#34C37A",
        lightGray: "#636363",
        listingBlack: "#222222",
        listingGray: "rgba(0, 0, 0, 0.65)",
        terraLemon: "rgba(119, 199, 32, 1)",
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
        property: "#F5F5F5",
        terraOrange: "#FFA72A",
        light: "#F9F9F9",
        reviewGold: "#F5A623",
        listingBg: " #F7F8F9",
      },

      fontFamily: {
        montserrat: ["Montserrat", "sans-serif"],
        pops: ["Poppins", "sans-serif", "Arial"],
        nunito: ["Nunito Sans", "sans-serif"],
        imCanon: ['"IM Fell French Canon"', "serif"],
        roboto: ["Roboto", "sans-serif"],
      },
      backgroundImage: {
        "gradient-radial": "radial-gradient(var(--tw-gradient-stops))",
        "gradient-conic": "conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))",
      },
      fontWeight: {
        extraThin: "300",
      },

      height: {
        property: "32rem",
        "property-card": "21.5rem",
        listHeight: "28rem",
        ellipse: "8rem",
      },
      minHeight: {
        property: "32rem",
        ellipse: "8rem",
      },

      width: {
        ellipse: "10.5em",
        "property-card": "12.5rem",
      },

      fontSize: {
        xxs: "0.6rem",
        line: "2px",
        tiny: "0.625rem",
        huge: "3rem",
        giant: "5rem",
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
        "slide-out": "slide-out 0.3s ease-in",
      },
    },
  },
  plugins: [
    require("tailwindcss-animate"),
    require("tailwind-scrollbar-hide"),
    require("flowbite/plugin"),
  ],
} satisfies Config;

export default config;
