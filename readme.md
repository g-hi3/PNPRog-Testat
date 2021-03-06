# PNProg-Testat

## Pitfall 1

    static void Main() {
      var task = IsPrimeAsync(10000000000000061L);
      Console.WriteLine("Other work");
      Console.WriteLine("Result {0}", task.Result);
    }

    public static async Task<bool> IsPrimeAsync(long number) {
      for (long i = 2; i <= Math.Sqrt(number); i++) {
        if (number % i == 0) { return false; }
      }
      return true;
    }

Der Code wird zwar als Task ausgeführt, aber die `Main`-Methode muss trotzdem warten, bis der Code fertig ist.

## Pitfall 2

Das `await`-Statement führt dazu, dass der Folge-Code in einem anderen Thread ausgeführt wird.

## Pitfall 3

    private async void downloadButton_Click(object sender, RoutedEventArgs e) {
      var client = new HttpClient();
      foreach (string url in UrlCollection) {
        var data = await client.GetStringAsync(url);
        outputTextBox.Text += string.Format("{0} downloaded: {1} bytes", url, data.Length) + Environment.NewLine;
      }
    }

Wenn der Benutzer den Button mehrmals hintereinander klickt, stauen sich die `GetStringAsync` calls auf resp. es gibt mehrere Requests gleichzeitig.

## Pitfall 4

    public async Task TestRunAsync() {
      var account = new BankAccount();
      var customer1 = CustomerBehaviorAsync(account);
      var customer2 = CustomerBehaviorAsync(account);
      await customer1;
      await customer2;
      if (account.Balance != 0) {
        throw new Exception(string.Format("Race condition occurred: Balance is {0}", account.Balance));
      }
    }

Je nach dem wie die beiden Tasks "Zeit haben", kann die `Balance` verstellt werden, weil die `Deposit`- und `Withdraw`-Operationen nicht nacheinander passieren.
Dadurch gibt es Probleme mit dem `Withdraw` und die `Balance` verliert die Balance &lt;finger guns&gt;.

## Pitfall 5

    private void calculationButton_Click(object sender, RoutedEventArgs e) {
      Task<string> task = CalculateAsync();
      resultLabel.Content = task.Result;
    }

    private async Task<string> CalculateAsync() {
      long number = long.Parse(inputTextBox.Text);
      return await Task.Run(() => {
        for (long i = 2; i <= Math.Sqrt(number); i++) {
          if (number % i == 0) {
            return "Not prime";
          }
        }

        return "Prime";
      });
    }

Der Aufruf von `task.Result` blockiert die Ausführung des `await` Tasks.