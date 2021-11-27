using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace day03
{
    class Program
    {
        static void Main(string[] args)
        {
            List<List<char>> values = new List<List<char>>();

            // Read in all of the input file, and break it into a list of charArray (each list entry is an array of characters)
            string line = string.Empty;
            StreamReader reader = new StreamReader(@"../../../input.txt");
            while ((line = reader.ReadLine()) != null)
            {
                values.Add(line.ToCharArray().ToList());
            }

            // Process Part One
            int partOneTrees = ProcessHitTrees(values, 3, 1);
            Console.WriteLine("Part One - Trees Hit: {0}", partOneTrees);

            // Part Two
            int[] moveRightNums = { 1, 3, 5, 7, 1 };
            int[] moveDownNums = {1, 1, 1, 1, 2};

            List<int> partTwoTreesHit = new List<int>();
            for ( int i = 0; i < moveRightNums.Length; i++)
            {
                partTwoTreesHit.Add(ProcessHitTrees(values, moveRightNums[i], moveDownNums[i]));
            }

            var product = partTwoTreesHit.Aggregate((val, next) => val * next);
            Console.WriteLine("Part Two - Product of all : {0}", product);

            // attempts
            // 124945920
            // 1577490944
        }
        static private int ProcessHitTrees(List<List<char>> rows, int moveRightVal, int moveDownVal)
        {
            int treesHit = 0;
            int curPos = moveRightVal; 

            for (int i = moveDownVal; i < rows.Count; i+=moveDownVal)
            {
                // check current position, increment tree hit if # is present.
                treesHit += (rows[i][curPos] == '#' ? 1 : 0);

                // Increment the current position, then check if it goes out of bounds. Reset if it does.
                curPos += moveRightVal;
                if (curPos >= rows[i].Count)
                {
                    curPos -= rows[i].Count;
                }
            }

            return treesHit;
        }
    }
}
