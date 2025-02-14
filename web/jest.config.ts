import type { Config } from "jest";
import nextJest from "next/jest.js";

const createJestConfig = nextJest({
  // Provide the path to your Next.js app to load next.config.js and .env files in your test environment
  dir: "./",
});

// Add any custom config to be passed to Jest
const config: Config = {
  setupFilesAfterEnv: ["<rootDir>/jest.setup.ts"],
  coverageProvider: "v8",
  testEnvironment: "jsdom",
  moduleNameMapper: {
    // Example assuming '@/hooks/use-navigation' should resolve to 'src/hooks/use-navigation'
    "^@/(.*)$": "<rootDir>/$1",
  },
  testEnvironmentOptions: {
    customExportConditions: [""],
  },
  collectCoverageFrom: [
    "src/**/*.{ts,tsx}",
    "app/**/*.{ts,tsx}",
    "components/**/*.{ts,tsx}",
    "redux/**/*.{ts,tsx}",
    "types/**/*.{ts,tsx}",
    "utils/**/*.{ts,tsx}",
    "wrappers/**/*.{ts,tsx}",
    "!src/**/*.d.ts",
    "!src/**/index.{js,jsx,ts,tsx}",
  ],
  coveragePathIgnorePatterns: ["/node_modules/", "/.next/"],
};

export default createJestConfig(config);
