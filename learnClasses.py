class stuBudget:
  def __init__(self, first, pay, car, house, food, other):
    self.first = first
    self.pay = pay
    self.car = car
    self.house = house
    self.food = food
    self.other = other
    self.savings = pay - (car +house+food+other)
  def quick(self):
    return((stu_1.first) + " makes " + str(stu_1.pay))
stu_1 = stuBudget("Jasmine",3000, 200, 600, 900, 110)

print(stu_1.quick())
