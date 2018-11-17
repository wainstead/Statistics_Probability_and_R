# build a vector 0.1, 0.2, .... 0.9
> p <- seq(from = 0.1, to = 0.9, by = 0.1)
# build a list of priors, where all are 0.6 except the fifth element,
# which is 0.52
> prior <- c(rep(0.06, 4), 0.52, rep(0.06, 4))
# build a binomial distribution for our data. Note the data is *fixed*
# for the "likelihood" as opposed to a "probability" where the data
# varies
> likelihood <- dbinom(4, size = 20, prob = p)
> likelihood
[1] 8.977883e-02 2.181994e-01 1.304210e-01 3.499079e-02 4.620552e-03 2.696862e-04 5.007558e-06
[8] 1.300570e-08 3.178804e-13
# calculate our numerator
> numerator <- prior * likelihood
# our denominator is the sum of all numerators
> denominator <- sum(numerator)
# finally calculate the posterior
> posterior <- numerator / denominator
# check: our posterior should sum to 1
> sum(posterior)
[1] 1
# what the stuff looks like:
> prior
[1] 0.06 0.06 0.06 0.06 0.52 0.06 0.06 0.06 0.06
> likelihood
[1] 8.977883e-02 2.181994e-01 1.304210e-01 3.499079e-02 4.620552e-03 2.696862e-04 5.007558e-06
[8] 1.300570e-08 3.178804e-13
> posterior
[1] 1.747658e-01 4.247525e-01 2.538808e-01 6.811397e-02 7.795220e-02 5.249779e-04 9.747841e-06
[8] 2.531722e-08 6.187942e-13
> plot(posterior)
