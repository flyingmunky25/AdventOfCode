using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.Marshalling;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace AdventOfCode
{
    internal class Utilities
    {
        internal static List<String> ConvertColumnsToRows(List<String> sourceList)
        {
            // Clone the inputList so we don't affect it, even though it's passed by value and not reference
            List<String> originalList = new List<String>(sourceList);

            List<String> transposedColumns = new List<String>();

            int longestRowLength = originalList.Aggregate("", (max, cur) => max.Length > cur.Length ? max : cur).Length;

            for (int col = 0; col < longestRowLength; col++)
            {
                List<String> columnValues = new List<String>();

                for (int row = 0; row < originalList.Count; row++)
                {
                    columnValues.Add(originalList[row][col].ToString());
                }

                transposedColumns.Add(String.Join("", columnValues));
            }

            return transposedColumns;
        }

        internal static List<String> ConvertDiagonalsToVerticals(List<String> sourceList, String diagonalDirection, char paddingCharacter, bool padBothSidesOfString = true)
        {
            // Clone the inputList so we don't affect it, even though it's passed by value and not reference
            List<String> transposedList = new List<String>(sourceList);
            int longestRowLength = sourceList.Aggregate("", (max, cur) => max.Length > cur.Length ? max : cur).Length;
            int totalCharactersNeeded = longestRowLength + sourceList.Count - 1;
            
            // For forward, work bottom left to top right direction
            if ( diagonalDirection == "forward")
            {
                int padCounter = 0;
                // Reverse for loop to pad extra characters
                for (int i = transposedList.Count-1; i >= 0; i--)
                {
                    String modifiedEntry = transposedList[i];
                    modifiedEntry = modifiedEntry.Insert(0, new String(paddingCharacter, padCounter));
                    
                    if ( padBothSidesOfString )
                    {
                        modifiedEntry += new string(paddingCharacter, ((longestRowLength - 1 - padCounter)));
                    }

                    transposedList[i] = modifiedEntry;
                    padCounter++;

                }
            }
            // For backwards, work top left to bottom right direction
            else if ( diagonalDirection == "backward")
            {
                int padCounter = 0;
                // Reverse for loop to pad extra characters
                for (int i = 0; i < transposedList.Count; i++)
                {
                    String modifiedEntry = transposedList[i];
                    modifiedEntry = modifiedEntry.Insert(0, new String(paddingCharacter, padCounter));

                    //transposedList[i]= transposedList[i].Insert(0, new String(paddingCharacter, padCounter));
                    if (padBothSidesOfString)
                    {
                        modifiedEntry += new string(paddingCharacter, ((longestRowLength - 1 - padCounter)));
                    }

                    transposedList[i] = modifiedEntry;

                    padCounter++;
                }
            }

            return transposedList;
        }

        internal static int CountOccurrencesWithPositiveLookahead(List<String> records, String pattern)
        {
            Regex matchRegex = new Regex("(?=" + pattern + ")|" + pattern);

            int totalFinds = 0;
            // Find the horizontal matches
            foreach (String record in records)
            {
                totalFinds += matchRegex.Matches(record).Count;
            }

            return totalFinds;
        }

        
    }
}
