using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;

namespace day04
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Passport> passports = new List<Passport>();

            StreamReader input = new StreamReader(@"../../../../input.txt");

            String line;
            Passport p = null;
            while ((line = input.ReadLine()) != null)
            {
                if (string.IsNullOrWhiteSpace(line))
                {
                    if (p != null)
                    {
                        passports.Add(p);
                    }
                    p = null;
                }
                else
                {
                    if (p == null)
                    {
                        p = new Passport();
                    }
                    Dictionary<string, string> pairs = line.Split(' ').Select(x => x.Split(':')).ToDictionary(key => key[0], val => val[1]);

                    foreach (KeyValuePair<string, string> pair in pairs)
                    {
                        int numOutput;
                        switch (pair.Key)
                        {
                            case "byr": { int.TryParse(pair.Value, out numOutput); p.byr = numOutput; break; }
                            case "iyr": { int.TryParse(pair.Value, out numOutput); p.iyr = numOutput; break; }
                            case "eyr": { int.TryParse(pair.Value, out numOutput); p.eyr = numOutput; break; }
                            case "hgt": { p.hgt = pair.Value; break; }
                            case "hcl": { p.hcl = pair.Value; break; }
                            case "ecl": { p.ecl = pair.Value; break; }
                            case "pid": { p.pid = pair.Value; break; }
                            default: { break; }
                        }
                    }
                }
            }
            passports.Add(p); // Add the final one in since the loop finished before being able to add to the list;

            var invalid = passports.Where(x => !x.hasAllValidFields()).ToList();
            Console.WriteLine("Part One - Has all required fields : " + passports.Where(x => x.hasAllFields()).Count());
            Console.WriteLine("Part Two - All fields are validated : " + passports.Where(x => x.hasAllFields()).Where(x => x.hasAllValidFields()).Count());


        }
    }

    class Passport
    {
        private string[] allowedECL = { "amb", "blu", "brn", "gry", "grn", "hzl", "oth" };
        public int? byr { get; set; }
        public int? iyr { get; set; }
        public int? eyr { get; set; }
        public string hgt { get; set; }
        public string hcl { get; set; }
        public string ecl { get; set; }
        public string pid { get; set; }

        public Passport()
        {

        }

        public bool hasAllValidFields()
        {
            bool isValid = true;
            if (byr == null || (!Regex.IsMatch(byr.ToString(), @"\d{4}") || byr < 1920 || byr > 2002))
                isValid = false;
            if (iyr == null || (!Regex.IsMatch(iyr.ToString(), @"\d{4}") || iyr < 2010 || iyr > 2020))
                isValid = false;
            if (eyr == null || (!Regex.IsMatch(eyr.ToString(), @"\d{4}") || eyr < 2020 || eyr > 2030))
                isValid = false;
            if (hcl == null || !Regex.IsMatch(hcl, @"^#[0-9a-f]{6}$"))
                isValid = false;
            if (pid == null || !Regex.IsMatch(pid, @"^\d{9}$"))
                isValid = false;
            if (ecl == null || !allowedECL.Contains(ecl))
                isValid = false;
            if (hgt != null)
            {
                if (hgt.Contains("in"))
                {
                    int hgtNum = Convert.ToInt32(hgt.Replace("in", ""));
                    if (hgtNum < 59 || hgtNum > 76)
                        isValid = false;
                }
                else if (hgt.Contains("cm"))
                {
                    int hgtNum = Convert.ToInt32(hgt.Replace("cm", ""));
                    if (hgtNum < 150 || hgtNum > 193)
                        isValid = false;
                }
                else
                    isValid = false;
            }
            else
                isValid = false;
            return isValid;
        }

        public bool hasAllFields()
        {
            if (byr != null && iyr != null && eyr != null && hgt != null && hcl != null && ecl != null && pid != null)
            {
                return true;
            }
            return false;
        }
    }
}