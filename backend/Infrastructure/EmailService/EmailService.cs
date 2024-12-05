using Application.Contracts;
using RestSharp;

namespace Infrastructure.EmailService
{
    public class EmailService : IEmailService
    {
        public async Task SendEmailAsync(string to, string subject, string body)
        {
            var apiKey = Environment.GetEnvironmentVariable("MAILGUN_API_KEY");
            var domain = Environment.GetEnvironmentVariable("MAILGUN_DOMAIN");

            if (string.IsNullOrEmpty(apiKey) || string.IsNullOrEmpty(domain))
            {
                throw new InvalidOperationException("Mailgun API key or domain is not configured.");
            }

            var client = new RestClient($"https://api.mailgun.net/v3/{domain}");
            var request = new RestRequest("messages", Method.Post);

            request.AddHeader("Authorization", $"Basic {Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes($"api:{apiKey}"))}");
            request.AddParameter("from", Environment.GetEnvironmentVariable("SENDER_EMAIL"));
            request.AddParameter("to", to);
            request.AddParameter("subject", subject);
            request.AddParameter("html", body);

            var response = await client.ExecuteAsync(request);

            if (!response.IsSuccessful)
            {
                throw new InvalidOperationException($"Error sending email: {response.ErrorMessage ?? response.Content}");
            }
        }
    }
}


