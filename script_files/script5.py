num = int(input("enter a number : "))
r_num = 0
while(num > 0):
  r = num % 10
  r_num = (r_num*10) + r
  num = num // 10
print(r_num)
