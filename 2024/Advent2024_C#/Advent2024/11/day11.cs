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
using System.Diagnostics;

namespace AdventOfCode
{
    internal class Day11
    {
        static int day = 11;

        public void RunDay()
        {
            String sampleInput = "125 17";
            String myInput = "475449 2599064 213 0 2 65 5755 51149";

            List<long> stones = sampleInput.Split(' ').Select(long.Parse).ToList();

            List<long> partOne = Process(25, new List<long>(stones), false);
            List<long> partTwo = Process(75, new List<long>(stones), false);

            Console.WriteLine($"Part One: {partOne.Count}");
            Console.WriteLine($"Part One: {partTwo.Count}");
        }

        internal List<long> Process(int numBlinks, List<long> stones, bool outputAfterBlink)
        {
            for (int blink = 1; blink <= numBlinks; blink++)
            {
                for (int stone = 0; stone < stones.Count; stone++)
                {
                    if (stones[stone] == 0)
                        stones[stone] = 1;
                    else if (stones[stone].ToString().ToCharArray().Length % 2 == 0)
                    {
                        // split the string array into 2, and combine digits
                        var stoneSplit = stones[stone].ToString().ToCharArray();
                        int middlePoint = stoneSplit.Length / 2;

                        var newLeft = long.Parse(String.Join("", stoneSplit.Take(middlePoint)));
                        var newRight = long.Parse(String.Join("", stoneSplit.Skip(middlePoint)));
                        stones[stone] = newLeft;
                        stones.Insert(stone + 1, newRight);
                        // Advance the count one more time because we added a new stone
                        stone++;
                    }
                    else
                    {
                        stones[stone] = stones[stone] * 2024;
                    }
                }

                if ( outputAfterBlink)
                    Console.WriteLine($"Blink: {blink}: {String.Join(" ", stones)}");

                Console.WriteLine(blink);
            }

            return stones;
        }
    }
}