input_string = input("enter a string  : ")
input_string
l = len(input_string)
for i in range(0,l,2):
  print("even index : ", i ,input_string[i])
