using System;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace TestUIThread {
    public partial class MainWindow : Window {

        private PrimeComputer pc = new PrimeComputer();

        public MainWindow() {
            InitializeComponent();
            pc.Progress = new Progress<long>(percent => {
                progressLabel.Content = percent + "%";
            });
        }

        private async void startCalculationButton_Click(object sender, RoutedEventArgs e) {
            if (pc.IsRunning) {
                pc.Cancel();
                startCalculationButton.Content = "Start";
            } else {
                long initial;
                long amount;
                if (!long.TryParse(baseNumberTextBox.Text, out initial) ||
                    !long.TryParse(succeedingPrimesTextBox.Text, out amount)) {
                    return;
                }

                startCalculationButton.Content = "Cancel";
                await Task.Run(() => pc.ComputeNextPrimes(initial, amount, resultListView));
                progressLabel.Content = "done";
            }
        }

        
    }
}
