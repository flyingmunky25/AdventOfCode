using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;
using System.Data.Common;
using AdventOfCode;

namespace AdventOfCode
{
    internal class Day04
    {
        public void RunDay()
        {
            List<String> records = File.ReadLines(@"C:\Scripting\AdventOfCode\2024\Advent2024_C#\Advent2024\04\04_SAMPLEinput.txt").ToList();

            int partOneFinds = 0;
            String partOneSearchPattern = "(XMAS|SAMX)";


            /****** PART ONE ******/
            // Find all horizontal values
            partOneFinds += Utilities.CountOccurrencesWithPositiveLookahead(records, partOneSearchPattern);

            // Convert the rows to columns, then count again
            List<String> columnConvert = Utilities.ConvertColumnsToRows(records);
            partOneFinds += Utilities.CountOccurrencesWithPositiveLookahead(columnConvert, partOneSearchPattern);

            // Search the "forward" diagonals.
            List<String> forwardDiagonals = Utilities.ConvertDiagonalsToVerticals(records, "forward", '.');
            forwardDiagonals = Utilities.ConvertColumnsToRows(forwardDiagonals);
            partOneFinds += Utilities.CountOccurrencesWithPositiveLookahead(forwardDiagonals, partOneSearchPattern);

            List<String> backwardsDiagonals = Utilities.ConvertDiagonalsToVerticals(records, "backward", '.');
            backwardsDiagonals = Utilities.ConvertColumnsToRows(backwardsDiagonals);
            partOneFinds += Utilities.CountOccurrencesWithPositiveLookahead(backwardsDiagonals, partOneSearchPattern);

            /****** PART TWO ******/
            int partTwoFinds = 0;

            // Reverse the forward list so it lines up with the backwards
            forwardDiagonals.Reverse();

            forwardDiagonals.ForEach(x => Console.WriteLine(x));
            Console.WriteLine("");
            backwardsDiagonals.ForEach(x => Console.WriteLine(x));


            
            //// list both diagonals
            //for (int row = 0; row < forwardDiagonals.Count; row++)
            //{
            //    String rowValue = forwardDiagonals[row];

            //    for (int col = 0; col < rowValue.Length - 3; col++)
            //    {
            //        if (
            //            (
            //                (rowValue[col] == 'M' && rowValue[col+1] == 'A' && rowValue[col+2] == 'S') && 
            //                (backwardsDiagonals[row][col + 2] == 'S' && backwardsDiagonals[row][col + 1] == 'A' && backwardsDiagonals[row][col] == 'M')
            //            ) ||
            //            (
            //                (rowValue[col] == 'S' && rowValue[col + 1] == 'A' && rowValue[col + 2] == 'M') &&
            //                (backwardsDiagonals[row][col + 2] == 'M' && backwardsDiagonals[row][col + 1] == 'A' && backwardsDiagonals[row][col] == 'S')
            //            )
            //        )
            //        {
            //            partTwoFinds++;
            //        }
            //    }
            //}


            Console.WriteLine($"Part One: {partOneFinds}");
            Console.WriteLine($"Part Two: {partTwoFinds}");
        }
    }
}