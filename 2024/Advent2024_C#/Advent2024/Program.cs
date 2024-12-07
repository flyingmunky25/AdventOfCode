using AdventOfCode;

Day d = new Day();
d.Run(4);

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
            default: throw new ArgumentException("Invalid day choice");
        }
    }
}