using Application.Contracts;
using System.Net.Mail;
using System.Net;

namespace Infrastructure.EmailService
{
    public class EmailService : IEmailService
    
    {
        public async Task SendEmailAsync(string to, string subject, string body)
        {
            var smtpClient = new SmtpClient
            {
                Host = System.Environment.GetEnvironmentVariable("SMTP_SERVER"),
                Port = int.Parse(System.Environment.GetEnvironmentVariable("SMTP_PORT")),
                EnableSsl = true,
                Credentials = new NetworkCredential(System.Environment.GetEnvironmentVariable("SMTP_USERNAME"), System.Environment.GetEnvironmentVariable("SMTP_PASSWORD")),
            };

            var mailMessage = new MailMessage
            {
                From = new MailAddress(System.Environment.GetEnvironmentVariable("SENDER_EMAIL")),
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            };

            mailMessage.To.Add(to);

            try
            {
                await smtpClient.SendMailAsync(mailMessage);
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Error sending email: {ex.Message}");
            }
        }
    }
}

