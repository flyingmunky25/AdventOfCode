using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;
using System.Data.Common;

namespace AdventOfCode
{
    internal class Day04
    {
        public void RunDay()
        {
            List<String> records = File.ReadLines(@"C:\Scripting\AdventOfCode\2024\Advent2024_C#\Advent2024\04\04_sampleInput.txt").ToList();

            int totalFinds = 0;

            // Find the horizontal matches
           var test = records.Select(x => Regex.Matches(x, "(?<=(XMAS|SAMX))").Count);

            // Convert the rows to columns, then count again
            List<String> columnConvert = ConvertListToColumns(records);
            totalFinds += columnConvert.Select(x => Regex.Matches(x, "(?<=(XMAS|SAMX))")).Count();

            foreach ( String record in records)
            {

            }

            // Find the horizontal matches
            // First, find the easy ones -- forwards and backwards
            //List<Match> matches = Regex.Matches(recordsFlattened, @"(?<=(XMAS|SAMX))").Cast<Match>().ToList();
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(X\w{8}M\w{8}A\w{8}S))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(X\w{9}M\w{9}A\w{9}S))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(X\w{10}M\w{10}A\w{10}S}))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(X\w{11}M\w{11}A\w{11}S}))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(S\w{8}A\w{8}M\w{8}X))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(S\w{9}A\w{9}M\w{9}X))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(S\w{10}A\w{10}M\w{10}X))").Cast<Match>().ToList());
            //matches.AddRange(Regex.Matches(recordsFlattened, @"(?<=(S\w{11}A\w{11}M\w{11}X))").Cast<Match>().ToList());

            //foreach ( Match m in matches)
            //{
            //    Console.WriteLine(m.Groups[1].Value);
            //}

        }

        internal List<String> ConvertListToColumns(List<String> inputList)
        {
            List<String> columns = new List<String>();
            
            int recordCount = inputList.Count;

            for ( int col = 0; col < recordCount; col++ )
            {
                List<char> columnValues = new List<char>();

                for ( int row = 0; row < inputList.Count; row++ ) 
                {
                    columnValues.Add(inputList[row][col]);
                }

                columns.Add(columnValues.ToString());
            }

            return columns;
        }

        internal List<String> ConvertListToDiagonals(List<String> inputList, String diagonalDirection)
        {
            return new List<string>();
        }
    }
}