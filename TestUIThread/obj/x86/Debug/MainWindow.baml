   M S B A M L   `   `   `  ����  TestUIThread    TestUIThread.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Prime Finder��5   	   $��454.354��6   $��256.306��6/   .��5      � $��10,0,-0.333,0.333q�6    � ColumnDefinitions 5   
   �� 5      $	��60* �6   �� 5      $
��179* �6    � RowDefinitions 5
   
   �� 5      $
��293* �6   �� 5      $
��133* �6   .+�5   
   �� -   5        $��startCalculationButton��5   E   $��Start��6   $��23��6!   $��0,142,20.333,0q�6-   $	��Top=�6c   $��Right=�6�   $��75��6�   $��1��6�   �� 5   
   -   5         ��Name$ baseNumberTextBox��5   6   $��23��6   $��10,41,20.333,0q�6   $	��Top=�6Q   $��10000000000000000��6i   $��2��6�   �� 5   
   -   5         ��Name$ baseNumberLabel��5      $��Base number:
��6)   $
��Left=�6J   $��	10,10,0,0q�6e   $	��Top=�6x   $��26��6�   $��2��6�   �� 5   
   -   5        $ suceedingPrimesLabel��5      $��Succeeding primes:��6.   $
��Left=�6K   $��	10,83,0,0q�6f   $	��Top=�6y   $��2��6�   �� 5   
   -   5        $ succeedingPrimesTextBox��5      $��23��63   $��10,114,20.333,0q�6?    �� TextWrapping$
 Wrap=�6X   $	��100��6l   $	��Top=�6w   $��2��6�   �� 5   
   -   5         ��Name$ resultListView��5      $��10,233,20.333,10.333q�6+   $��2��6I   $��2��6Z    �� View 5      �� 5      .P�5      �� 5      5      �� 5   
   -   5        $ primesResultLabel��5      $��Primes:��6+   $
��Left=�6=   $��
10,202,0,0q�6X   $	��Top=�6l   �� 5   
   -   5        $ progressLabel��5      $��(ready)��6'   $
��Left=�69   $��
10,170,0,0q�6T   $	��Top=�6h   $��2��6�   $	��207��6�   5      5      