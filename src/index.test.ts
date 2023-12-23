import { hello } from "./index";

describe("hello function", () => {
  it("greets the user", () => {
    expect(hello("World")).toBe("Hello, World!");
  });
});
