#1st
product = ("Laptop",50000,"Black","Samsung","Electronics")
print(product)

#2nd
second_ele = product[1]
print(second_ele)

#3rd
slice = product[-2:] 
print(slice)

#4th
print("Electronics" in product)

#5th
prices = (1000,1500,1200,1100,900)
print(prices.count(1000))

#6th
print(min(prices))
print(max(prices))

#7th
for i in range(len(product)):
    print(product[i])

#8th
l = list(product)
l[1] = 55000
product = tuple(l)
print(product)

#9th
product = product + ("In stock",)
print(product)

#10th
l = list(product)
l.remove("Electronics")
product = tuple(l)
print(product)

#11th
a, b, *c = product
print(a)
print(b)
print(c)

#12th
nest_products = (("Laptop",50000,"Black","Samsung","Electronics"),("Moblie",28000,"Black","Samsung","Electronics"),("Headphones",20000,"Black","Samsung","Electronics"))
print(nest_products[1])