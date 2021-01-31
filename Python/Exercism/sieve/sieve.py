def primes(limit):
    numbers = [0]*(limit+1)
    prime = []
    for i in range(2,limit+1):
        if numbers[i] == 0:
            prime.append(i)
            for i in range(i,limit+1,i):
                numbers[i] = 1
    return prime


if __name__ == "__main__":
    print(primes(20))
