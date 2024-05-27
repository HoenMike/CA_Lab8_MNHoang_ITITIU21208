def evaluate_polynomial(coefficients, x):
    result = 0
    for coefficient in coefficients:
        result = result * x + coefficient
    return result

# Example usage:
coefficients = [4.3, -12.4, 6.8, -0.45, 3.6]  # The polynomial coefficients
x_value = 8  # The value of x at which to evaluate the polynomial
print("\nThe polynomial value at x =", x_value, "is", evaluate_polynomial(coefficients, x_value),"\n")
