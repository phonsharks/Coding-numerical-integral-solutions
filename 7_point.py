# Boole's rule
 
# Given function to be integrated
def func(x):     
    return (float(1) / ( 1 + x * x ))
   
# Function to perform calculations
def calculate(lower_limit, upper_limit, interval_limit ):
     
    interval_size = (float(upper_limit - lower_limit) / interval_limit)
    sum = 41*(func(lower_limit) + func(upper_limit));
  
    # Calculates value till integral limit
    for i in range(1, interval_limit ):
        if (i % 6 == 0):
            sum = sum + 82 * func(lower_limit + i * interval_size)
        elif (i%6==1):
            sum = sum + 216 * func(lower_limit + i * interval_size)
        elif (i%6==2):
            sum = sum + 27 * func(lower_limit + i * interval_size)
        elif (i%6==3):
            sum = sum + 272 * func(lower_limit + i * interval_size)
        elif (i%6==4):
            sum = sum + 27 * func(lower_limit + i * interval_size)
        elif (i%6==5):
            sum = sum + 216 * func(lower_limit + i * interval_size)
     
    return ((float( 1 * interval_size) / 140 ) * sum )
 
# driver function
interval_limit = 14
lower_limit = 1
upper_limit = 2
 
integral_res = calculate(lower_limit, upper_limit, interval_limit)
 
# rounding the final answer to 6 decimal places
print (round(integral_res, 6))
 
# This code is contributed by Saloni.
