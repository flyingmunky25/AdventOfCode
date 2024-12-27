using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;
using System.Data.Common;
using AdventOfCode;
using System.Net;

namespace AdventOfCode
{
    internal class Day07
    {
        public void RunDay()
        {
            List<string> records = File.ReadLines(@"C:\Scripting\AdventOfCode\2024\Advent2024_C#\Advent2024\07\07_sampleinput.txt").ToList();

            long partOne = runCalculations(records, false);
            long partTwo = runCalculations(records, true);

            Console.WriteLine($"Part One: {partOne}");
            Console.WriteLine($"Part Two: {partTwo}");
        }

        private long runCalculations(List<string> records, bool shouldConcat)
        {
            List<long> sums = new List<long>();

            foreach (string line in records)
            {
                List<string> values = line.Split(':').ToList();
                long target = long.Parse(values[0]);

                long[] digits = values[1].Split(' ', StringSplitOptions.RemoveEmptyEntries).Select(s => long.Parse(s)).ToArray();

                List<long> results = new List<long>();

                foreach (long digit in digits)
                {
                    if (results.Count == 0)
                    {
                        results.Add(digit);
                        continue;
                    }

                    List<long> resultsToAdd = new List<long>();

                    foreach (long result in results)
                    {
                        long addition = result + digit;
                        long multiplication = result * digit;

                        if (addition <= target)
                        {
                            resultsToAdd.Add(addition);
                        }

                        if (multiplication <= target)
                        {
                            resultsToAdd.Add(multiplication);
                        }

                        if (shouldConcat)
                        {
                            long concatValue = long.Parse(result.ToString() + digit.ToString());

                            if (concatValue <= target)
                            {
                                resultsToAdd.Add(concatValue);
                            }
                        }
                        results = resultsToAdd;
                    }

                    var match = results.FirstOrDefault(x => x == target);

                    sums.Add(match);
                }
            }

            return sums.Sum();
        }
    }
}