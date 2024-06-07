##################################################################
# June 7, 2024
# Lu Qiu
#
# SIBDS practice Week 2 Problem 2
##################################################################

# codes for Unit 3 Problem 5

## Distribution: X ~ binomial(15,0.2)

## 5b

n = 15
pi = 0.20

ans_5b = dbinom(4, n, pi)
round(ans_5b, 3)
### Ans: 0.188

## 5c

ans_5c = pbinom(4, n, pi)
round(ans_5c, 3)
### Ans: 0.836

## 5d

ans_5d = pbinom(3, n, pi) 
ans_5d_sum = dbinom(0, n, pi) + dbinom(1, n, pi) + dbinom(2, n, pi) + dbinom(3, n, pi)
round(ans_5d, 3) 

### Ans: 0.648

## 5e

ans_5e = 1 - pbinom(3, n, pi)
round(ans_5e, 3)
### Ans: 0.352

## 5f

exp_val = n * pi
exp_val

variance = n * pi * (1 - pi)
variance

### Ans: 3, 2.4




## 6a

mean = 172.2
std = 29.8

ans_6a = pnorm(150, mean, std)
ans_6a

## 6b

ans_6b = 1 - pnorm(200, mean, std)
ans_6b

ans_6b_upper = pnorm(200, mean, std, lower.tail = FALSE)
ans_6b_upper

## 6c

ans_6c = pnorm(190, mean, std) - pnorm(140, mean, std)
ans_6c

## 6d

ans_6d = pnorm(150, mean, std) + pnorm(190, mean, std, lower.tail = FALSE)
# P(X < 150) + P(X)> 190
ans_6d
