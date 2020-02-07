using System;
using System.Windows.Controls;

namespace TestUIThread {
    class PrimeComputer {

        private bool hasBeenCancelled;

        public void ComputeNextPrimes(long inital, long amount, ListView resultListView) {
            for (long number = inital, end = inital + amount; number < end; number++) {
                if (hasBeenCancelled) {
                    hasBeenCancelled = false;
                    return;
                }
                if (IsPrime(number)) {
                    resultListView.Items.Add(number);
                }
                Progress?.Report(number / end);
            }
        }

        private bool IsPrime(long number) {
            for (long i = 2; i * i <= number; i++) {
                if (number % i == 0) {
                    return false;
                }
            }

            return true;
        }

        public void Cancel() {
            hasBeenCancelled = true;
        }

        public IProgress<long> Progress { get; set; }

        public bool IsRunning => !hasBeenCancelled;

    }
}