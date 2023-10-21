import sys
import re

total_points = 50
percent_per_error = 0.05
min_grade = 25
max_n = 47

def fib(n):
    x = 0
    y = 1
    if n == 0:
        return 0
    
    for i in range(2, n+1):
        temp = x + y
        x = y
        y = temp

    return y

errors = 0
inputs = 0
filename = sys.argv[1]

with open(filename) as fp:
    lines = fp.readlines()

    p = re.compile('(\d*):\s*HW\s*=\s*(\d*),\s*SW\s*=\s*(\d*)')

    for line in lines:
        m = p.match(line)
        if m:
            i = int(m.group(1))
            hw = int(m.group(2))
            sw = int(m.group(3))
            result = fib(i)
            
            inputs = inputs + 1
            
            if result != hw:
                print(f'HW result incorrect for input {i}:', end = ' ')
                print(f'Actual={hw}, Correct={result}')
                errors = errors + 1;

            if result != sw:
                print(f'SW result incorrect for input {i}:', end = ' ')
                print(f'Actual={sw}, Correct={result}')
                errors = errors + 1;

if inputs != max_n + 1:
    print(f'Error: detected {inputs} outputs of {max_n+1} results.')

print(f'Total Errors: {errors}')
grade = total_points - total_points * percent_per_error * errors
if grade < min_grade:
    grade = min_grade

print(f'Corresponding grade: {grade}%')
