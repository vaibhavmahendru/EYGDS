def result_list(l1,l2):
  res_list = []

  for n in l1:
    if n % 2 != 0:
      res_list.append(n)

  for n in l2:
    if n % 2 == 0:
      res_list.append(n)

  return res_list

l1 = [11,22,33,44]
l2 = [99,88,77,66]

print("updated list  :  ",result_list(l1,l2))
