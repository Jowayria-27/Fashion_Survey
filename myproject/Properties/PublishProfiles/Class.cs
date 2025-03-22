namespace Survey.Properties.PublishProfiles
{
    using System;
    using Npgsql;

    class Program
    {
        static void Main()
        {
            // Connection string
            string connString = "Host=localhost;Port=5432;Username=postgres;Password=19article@postgres;Database=survey";

            // Create connection
            using (var conn = new NpgsqlConnection(connString))
            {
                try
                {
                    conn.Open();
                    Console.WriteLine("Connected to PostgreSQL successfully!");

                    // Execute a query
                    using (var cmd = new NpgsqlCommand("SELECT version();", conn))
                    {
                        string version = cmd.ExecuteScalar().ToString();
                        Console.WriteLine($"PostgreSQL Version: {version}");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                }
            }
        }
    }

}
