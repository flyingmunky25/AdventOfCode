using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


/* part two incorrect guesses:
 * 289
 * 301
 * 
 * index 75 edge case: 83 87 89 90 93 96 99
 */
namespace AdventOfCode
{
    internal class Day02
    {
        const int MAX_DIFF = 3;
        const int MIN_DIFF = 1;

        bool IsSafe1(IEnumerable<int> a) =>
    IsSafe(a.Zip(a.Skip(1), (x, y) => x - y));

        bool IsSafe2(IEnumerable<int> a) =>
            Enumerable.Range(0, a.Count())
                .Any(i => IsSafe1(a.Take(i).Concat(a.Skip(i + 1))));

        bool IsSafe(IEnumerable<int> b) =>
            b.All(x => x >= -3 && x <= -1) ||
            b.All(x => x >= 1 && x <= 3);

        public void RunDay()
        {
            var input = File.ReadLines(@"sampleinput.txt")
    .Select(s => s.Split(' ').Select(int.Parse));

            Console.WriteLine(input.Count(IsSafe1));
            Console.WriteLine(input.Count(IsSafe2));
            //    List<List<int>> reports = new List<List<int>>();
            //    StreamReader reader = new StreamReader(@"C:\Scripting\AdventOfCode\2024\Advent2024_C#\Advent2024\inputFiles\input.txt");
            //    String line = String.Empty;
            //    List<int> partOneValidEntries = new List<int>();
            //    List<int> partTwoValidEntries = new List<int>();

            //    // Read in the data, store it in a List of "reports"
            //    while ((line = reader.ReadLine()) != null)
            //    {
            //        List<int> tempList = new List<int>();
            //        reports.Add(Array.ConvertAll(line.Split(' '), int.Parse).ToList());
            //    }

            //    // Iterate over the input file (reports)
            //    for (int curReport = 0; curReport < reports.Count; curReport++)
            //    {
            //        bool isValid = IsValidReport(reports[curReport]);

            //        if (isValid)
            //        {
            //            partOneValidEntries.Add(curReport);
            //        }
            //        else  // Check part 2
            //        {
            //            // Check if there's excess that we can up-front consider bad
            //            List<int> reportDirections = GetReportDirections(reports[curReport]);
            //            List<int> reportDifferences = GetReportDifferences(reports[curReport]);

            //            var badDirection = reportDirections.GroupBy(x => x).Where(x => x.Count() == 1).ToList();
            //            var badDifferences = reportDifferences.Where(x => x > 3 || x < 1).ToList();

            //            if (badDirection.Count == 1)
            //            {
            //                // We have a single bad direction, let's remove it and re-test the list.
            //                var key = badDirection[0].Key;
            //                reports[curReport].RemoveAt(reportDirections.IndexOf(key));

            //                isValid = IsValidReport(reports[curReport]);

            //                if (isValid)
            //                {
            //                    partTwoValidEntries.Add(curReport);
            //                }
            //            }
            //            else if (badDifferences.Count() == 1)
            //            {
            //                // We have a single bad direction, let's remove it and re-test the list.
            //                int key = badDifferences[0];
            //                reports[curReport].RemoveAt(reportDifferences.IndexOf(key) + 1);

            //                isValid = IsValidReport(reports[curReport]);

            //                if (isValid)
            //                {
            //                    partTwoValidEntries.Add(curReport);
            //                }
            //            }
            //        }
            //    }

            //    // Combine parts one and two lists together for part two's answer
            //    partTwoValidEntries.AddRange(partOneValidEntries);
            //    Console.WriteLine("Part One: " + partOneValidEntries.Count);
            //    Console.WriteLine("Part Two: " + partTwoValidEntries.Count);
            //}

            //internal bool isOrdered(List<int> report, bool descending)
            //{
            //    if (descending)
            //        return report.Zip(report.Skip(1), (curr, next) => curr > next).All(x => x);
            //    return report.Zip(report.Skip(1), (curr, next) => curr < next).All(x => x);
            //}

            //internal int FindBadDifference(List<int> report)
            //{
            //    int curDifference = 0;

            //    for ( int i = 0; i < report.Count; i++)
            //    {
            //        curDifference = Math.Abs(report[i] - report[i + 1]);
            //    }
            //    return -1;
            //}

            //internal int GetDirection(int value1, int value2)
            //{
            //    if (value1 < value2) return 1;
            //    if (value1 > value2) return -1;
            //    return 0;
            //}

            //internal List<int> GetReportDirections(List<int> report)
            //{
            //    List<int> reportDirections = new List<int>();

            //    // Get the differences and directions of the report
            //    for (int reportValue = 0; reportValue < report.Count - 1; reportValue++)
            //    {
            //        reportDirections.Add(GetDirection(report[reportValue], report[reportValue + 1]));
            //    }

            //    return reportDirections;
            //}

            //internal List<int> GetReportDifferences(List<int> report)
            //{
            //    List<int> reportDifferences = new List<int>();

            //    // Get the differences and directions of the report
            //    for (int reportValue = 0; reportValue < report.Count - 1; reportValue++)
            //    {
            //        reportDifferences.Add(Math.Abs(report[reportValue] - report[reportValue + 1]));
            //    }

            //    return reportDifferences;
            //}

            //internal bool IsValidReport(List<int> report)
            //{
            //    // Create empty List variables to hold differences and directions
            //    List<int> reportDirections = GetReportDirections(report);
            //    List<int> reportDifferences = GetReportDifferences(report);

            //    // Check if the report is valid or not
            //    bool allSameDirection = reportDirections.Distinct().Count() == 1;
            //    int diffMin = reportDifferences.Min();
            //    int diffMax = reportDifferences.Max();

            //    if (allSameDirection && diffMin >= MIN_DIFF && diffMax <= MAX_DIFF)
            //    {
            //        return true;
            //    }

            //    return false;
            //}
        }
    }
}