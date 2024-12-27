using AdventOfCode;

Day d = new Day();
d.Run(11);

internal class Day
{
    public void Run(int d)
    {
        switch (d)
        {
            case 2:
                Day02 day2 = new Day02();
                day2.RunDay();
                break;
            case 4:
                Day04 day4 = new Day04();
                day4.RunDay();
                break;
            case 7:
                Day07 day7 = new Day07();
                day7.RunDay();
                break;
            case 11:
                Day11 day11 = new Day11();
                day11.RunDay();
                break;
            default: throw new ArgumentException("Invalid day choice");
        }
    }
}