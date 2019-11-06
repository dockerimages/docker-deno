import { lambda } from "./bundle.ts";

lambda.handler = (event, context) => {
  console.log("from bundle");
  console.log(event);
};
