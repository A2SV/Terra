import "@testing-library/jest-dom";
import { TextEncoder } from "util";
const { Response, Headers, Request } = require("whatwg-fetch");

global.Response = Response;
global.Headers = Headers;
global.Request = Request;
global.TextEncoder = TextEncoder;
