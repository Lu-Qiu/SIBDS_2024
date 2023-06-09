##################################################################
# June 8, 2023
# Ryan Wei
#
# SIBDS practice with distributions functions in R
##################################################################

# codes for Unit 3 Problem 5

## 5b

n = 15
pi = 0.20

ans_5b = dbinom(4, size = n, prob = pi) # P(X = 4)
#dbinom(4, pi, n)
dbinom(4, n, pi)

### Ans: 0.188

## 5c

ans_5c = pbinom(4, n, pi)
round(ans_5c, 3)
### Ans: 0.836

## 5d

ans_5d = pbinom(3, n, pi) # P(X = 0) + P(X = 1) + P(X = 2) + P(X = 3), CDF
ans_5d_sum = dbinom(0, n, pi) + dbinom(1, n, pi) + dbinom(2, n, pi) + dbinom(3, n, pi)
round(ans_5d, 3) # PMF/PDF

### Ans: 0.648

## 5e

ans_5e = 1 - pbinom(3,n,pi)
ans_5e
# lower.tail = TRUE gives us the left shaded area of a pdf
ans_5e_upper = pbinom(3, n, pi, lower.tail = FALSE)
round(ans_5e_upper, 3)
### Ans: 0.352

## 5f

exp_val = n * pi
variance = n * pi * (1-pi)

### Ans: 3, 2.4




## 6a

mean_val = 172.2
std = 29.8

ans_6a = pnorm(150, mean_val, std)
ans_6a

## 6b

ans_6b = 1 - pnorm(200, mean_val, std)
ans_6b_upper = pnorm(200, mean_val, std, lower.tail = FALSE)
ans_6b
ans_6b_upper

## 6c

ans_6c = pnorm(190, mean_val, std) - pnorm(140, mean_val, std)
ans_6c

## 6d

ans_6d = pnorm(150, mean_val, std) + pnorm(190, mean_val, std, lower.tail = FALSE)
# P(X < 150) + P(X)> 190
ans_6d
