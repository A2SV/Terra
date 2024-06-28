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
      },
      fontFamily: {
        montserrat: ["Montserrat", "sans-serif"],
        pops: ["Poppins", "sans-serif", "Arial"],
        nunito: ["Nunito Sans", "sans-serif"],
        sans: ['Nunito Sans', 'sans-serif']
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config;

export default config;
