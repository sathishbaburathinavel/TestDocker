using System;
using System.Drawing;
using System.Reflection;

namespace Demo
{
    public class Program
    {
        static void Main(string[] args)
        {
			Console.WriteLine("Assembly Names");
            foreach(string assemblyName in GetAssemblyNames())
            {
                Console.WriteLine(assemblyName);
            }
			
        }
        public static string[] GetAssemblyNames()
        {
            Assembly assembly = typeof(Program).Assembly;
            AssemblyName[] referncedAssemblies = assembly.GetReferencedAssemblies();
            string[] assemblies = new string[referncedAssemblies.Length];
            int i = 0;
            foreach (AssemblyName assemblyName in referncedAssemblies)
            {
                assemblies[i++] = assemblyName.FullName;
            }
            return assemblies;
        }
    }
}
