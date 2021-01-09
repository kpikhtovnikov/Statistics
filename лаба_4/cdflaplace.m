function fx = cdflaplace(x, mu, sigma)

fx = 0.5*(1 + sign(x-mu).*(1 - exp( -abs(x-mu)/(sigma/sqrt(2)) )));

end